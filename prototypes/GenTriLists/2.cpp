
#include <cal3d/cal3d.h>
#include <iostream>
#include <cassert>
#include <cstdio>
#include <string>
#include <vector>
#include <list>
#include <set>

using namespace std;

typedef unsigned int uint;

namespace
{
    template <class _Iter, class _Val>
    int find(_Iter first, _Iter last, const _Val& val)
    {
        int i=0;
        while (first != last)
        {
            if (*first == val)
                return i;
            i++;
            first++;
        }

        return -1;
    }

    /*
    // can't deduce _Size. :(
    template <class T,int _Size>
    void fill(T arr[_Size],const T& val)
    {
        for (int i=0; i<_Size; i++)
            arr[i] = val;
    }
    */

    struct Face
    {
        int v[3];       // vertices
        int edges[3];   // edges that this face touches

        Face(int a,int b,int c)
        {
            v[0] = a; v[1] = b; v[2] = c;
            std::fill(edges, edges + 3, -1);
        }

        Face(int* a)
        {
            std::copy(a,a+3,v);
        }

        int sharedEdge(const Face& rhs) const
        {
            for (int i=0; i<3; i++)
                for (int j=0; j<3; j++)
                    if (edges[i] == edges[j])
                        return i;
            return -1;
        }

        int diffVertex(const Face& rhs) const
        {
            for (int i=0; i<3; i++)
                if (v[i] != rhs.v[0] &&
                    v[i] != rhs.v[1] &&
                    v[i] != rhs.v[2])
                    return v[i];
            return -1; // @_x
        }

        bool hasVertex(int a) const
        {
            for (int i=0; i<3; i++)
                if (v[i] == a)
                    return true;
            return false;
        }

    };

    struct Edge
    {
        int v[2];   // vertices that make up this edge
        int f[2];   // faces that touch this edge

        Edge(){}
        Edge(int a,int b) { v[0] = a; v[1] = b; }

        bool operator == (const Edge& rhs)
        {
            return
                (v[0] == rhs.v[0] && v[1] == rhs.v[1]) ||
                (v[1] == rhs.v[0] && v[0] == rhs.v[1])
                ;
        }
    };

    vector<Edge> getEdges(vector<Face>& faces)
    {
        vector<Edge> edges;

        for (uint curface=0; curface<faces.size(); curface++)
        {
            Face& face = faces[curface];
            for (int curside = 0; curside < 3; curside++)
            {
                int f1 = face.v[curside];
                int f2 = face.v[(curside + 1) % 3];

                Edge curedge(f1, f2);
                curedge.f[0] = curface;
                curedge.f[1] = -1;

                int pos = find(edges.begin(), edges.end(), curedge);
                if (pos != -1)  // already dealt with this edge?
                {
                    face.edges[curside] = pos;
                }
                else
                {
                    face.edges[curside] = int(edges.size());

                    for (uint j = 0; j < faces.size(); j++)                          // Find another triangle using this edge
                    {
                        if (j == curface)
                            continue;

                        int count=0;
                        for (int i = 0; i < 3; i++)
                            if (faces[j].v[i] == f1 || faces[j].v[i] == f2)
                                count++;

                        if (count == 2)   // this triangle also shares this edge
                        {
                            curedge.f[1] = j;
                            break;
                        }
                    }

                    edges.push_back(curedge);
                }

                assert(face.edges[curside] >= 0);
            }
        }

        return edges;
    }

    int depth = 0;
    const int max = 200;

    vector<Face> getFaces(CalCoreSubmesh* mesh)
    {
        vector<CalCoreSubmesh::Face> src = mesh->getVectorFace();
        vector<Face> dest;
        dest.reserve(src.size());

        for (uint i=0; i<src.size(); i++)
            dest.push_back(Face(src[i].vertexId));

        return dest;
    }

    list<int> getList(int lasttri, int lastvert, int vertbeforelast, set<int> facesused, const vector<Face>& faces, const vector<Edge>& edges, bool reversed = false)
    {
        assert(lasttri >= 0 && lasttri < faces.size());

        depth++;

        if (depth > max)
        {
            depth--;
            return list<int>();
        }

        const Face& curface = faces[lasttri];
 
        list<int> best;

        for (int edge = 0; edge < 3; edge++)
        {
            if (curface.edges[edge] == -1)
                continue;

            const Edge& curedge = edges[curface.edges[edge]];
            // find another triangle using this edge
            for (int i = 0; i < 2; i++)
            {
                int f = curedge.f[i];

                if (f == lasttri || f == -1)
                    continue;

                if (facesused.count(f) != 0)        // this triangle is already in the list somewhere
                    continue;

                if (lastvert != -1 &&
                    !faces[f].hasVertex(lastvert))
                    continue;                       // it has to touch the last vertex (if lastvert is -1, then there is no last vertex)

                if (vertbeforelast!= -1 &&
                    !faces[f].hasVertex(vertbeforelast))
                    continue;

                set<int> _facesused(facesused);
                _facesused.insert(f);

                int _lastvert = faces[f].diffVertex(curface);

                list<int> newlist = getList(f, _lastvert, lastvert, _facesused, faces, edges, reversed);
                newlist.push_front(f);

                if (newlist.size()+depth > max)
                {
                    depth--;
                    return newlist;
                }

                if (newlist.size() > best.size())
                    best = newlist;

            }
        }

        depth--;
        return best;
    }

    int BestStartTriangle(const vector<Face>& faces, const vector<Edge>& edges, const set<int>& usedfaces)
    {
        int adj[4] = {-1,-1,-1,-1};
        std::fill(adj,adj+3,-1);

        // Find one that's only adjacent to one other triangle
        for (uint i=0; i<faces.size(); i++)
        {
            if (usedfaces.count(i) != 0)
                continue;

            int count=0;
            for (int j=0; j<3; j++)
            {
                if (faces[i].edges[j] == -1)
                    count++;

                const Edge& edge = edges[faces[i].edges[j]];
                int idx=0;
                if (edge.f[idx] == i)
                    idx++;

                if (usedfaces.count(edge.f[idx]) != 0)
                    count++;
            }

            if (count == 1)
                return i;
            else
                if (adj[count] == -1)
                    adj[count]=i;
        }

        // 0 sucks, but it has to go in sometime.
        // 1 is perfect.  The loop will return if it finds such a triangle; execution will never get here in such a case
        // 2 is better than 3
        // 3 is the last resort
        for (int i=0; i<4; i++)
            if (adj[i] != -1)
                return adj[i];
        return -1;  // no more triangles? @_x
    }
    
    list<int> faceListToTriStrip(const list<int>& lst, const vector<Face>& faces)
    {
        list<int> strip;
        list<int>::const_iterator iter;

        // trivial case
        if (lst.size() == 1)
        {
            const Face& f = faces[lst.front()];

            for (int i=0; i<3; i++)
                strip.push_back(f.v[i]);
    
            return strip;
        }

        // first, rotate the points in the first face so that they link up with the second properly.
        int uniquevert=-1;
        iter = lst.begin(); iter++;
        const Face& f = faces[lst.front()];
        const Face& g = faces[*iter];
        for (int i=0; i<3; i++)
        {
            if (f.v[i] != g.v[0] &&
                f.v[i] != g.v[1] &&
                f.v[i] != g.v[2])
            {
                uniquevert=i;
                break;
            }
        }

        // push the unique one first.  The shared two will follow. (since we're "rotating" the points
        // around instead of just swapping, the winding should be preserved)
        for (int i=0; i<3; i++)
            strip.push_back(f.v[(i+uniquevert) % 3]);

        // now for the rest.  Just find the point that's not in the previous triangle, and add it.
        int lastface = lst.front();
        iter = lst.begin();
        iter++;
        for (; iter != lst.end(); iter++)
        {
            const Face& lf = faces[lastface]; // last face
            const Face& tf = faces[*iter];    // this face

            for (int i = 0; i < 3; i++)
            {
                if (tf.v[i] != lf.v[0] &&
                    tf.v[i] != lf.v[1] &&
                    tf.v[i] != lf.v[2])
                {
                    strip.push_back(tf.v[i]);
                    break;
                }

                if (i==2)
                    __asm int 3;
            }

            lastface = *iter;
        }

        return strip;
    }
}

void MakeLists2(const char* fname)
{
    CalLoader loader;

    CalCoreMesh* mesh = loader.loadCoreMesh(fname);
    if (!mesh)
        return;

    string outname = fname;
    size_t pos = outname.find_last_of('.');
    if (pos != -1)
        outname = outname.substr(0,pos);
    outname += ".trilist";

    FILE* output = fopen(outname.c_str(),"wt");
    fprintf(output,"Submeshes %i\n", mesh->getCoreSubmeshCount());

    for (int i = 0; i < mesh->getCoreSubmeshCount(); i++)
    {
        vector<Face> faces = getFaces(mesh->getCoreSubmesh(i));
        vector<Edge> edges = getEdges(faces);

        cout << "Faces: " << int(faces.size()) << "\tEdges: " << int(edges.size()) << endl;

        list< list<int> > tristrips;
        set<int> usedfaces;

        while (usedfaces.size() < faces.size())
        {
            int firsttri = BestStartTriangle(faces, edges, usedfaces);

            usedfaces.insert(firsttri);

            list<int> nextlist = getList(firsttri, -1, -1, usedfaces, faces, edges);
            nextlist.push_front(firsttri);

            usedfaces.insert(nextlist.begin(),nextlist.end());
            tristrips.push_back(nextlist);

            cout << "List: " << int(nextlist.size()) << endl;
        }

        cout << "Writing..." << endl;

        fprintf(output, "Strips %i\n", tristrips.size());
        int totalfaces=0;
        for (list< list<int> >::iterator i = tristrips.begin(); i != tristrips.end(); i++)
        {
            totalfaces += int(i->size());
            list<int> lst = faceListToTriStrip(*i,faces);

            fprintf(output, "Vertices %i\n", lst.size());
            for (list<int>::iterator j = lst.begin(); j != lst.end(); j++)
            {
                int f = *j;
                fprintf(output, "%i ",f);
            }
            fprintf(output, "\n");
         }

        cout << "Faces: " << totalfaces << endl;
    }

    fclose(output);
}