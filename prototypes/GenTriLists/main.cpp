
#include <cal3d/cal3d.h>
#include <string>
#include <vector>
#include <list>
#include <set>
#include <cstdio>
#include <iostream>

using namespace std;
typedef CalCoreSubmesh::Face Face;
typedef list<int> TriList;

CalLoader loader;
size_t totallists=0;
size_t totallistlength=0;
size_t totalfaces=0;

namespace one
{
    bool IsAdjacent(int a,int b,const Face& f,int& unshared)
    {
        int adj=0;
        for (int i=0; i<3; i++)
            if (f.vertexId[i]==a || f.vertexId[i]==b)
                adj++;
            else
                unshared=f.vertexId[i];

        return adj==2;
    }

    TriList MakeList(vector<Face>& faces)
    {
        TriList tris;

        Face curface=faces.back();
        faces.pop_back();

        for (int i=0; i<3; i++)
            tris.push_back(curface.vertexId[i]);

        bool boogah=true;

        int last[2];
        last[0]=curface.vertexId[1];
        last[1]=curface.vertexId[2];

        do
        {
            for (unsigned int i=0; i<faces.size(); i++)
            {
                int unshared;
                if (IsAdjacent(last[0],last[1],faces[i],unshared))
                {
                    tris.push_back(unshared);
                    faces.erase(faces.begin()+i);

                    last[0]=last[1];
                    last[1]=unshared;
                    continue;
                }
            }
            // if we reach this point, then we've hit the end of the line, so let's try going backwards
            if (boogah)
            {
                tris.reverse();
                TriList::iterator iter=tris.end();
                last[1]=*--iter;
                last[0]=*--iter;
                boogah=false;
                continue;
            }

            break;
        } while (true);

        return tris;
    }

    void MakeLists(const char* fname)
    {
        CalCoreMesh* mesh=loader.loadCoreMesh(fname);
        if (!mesh)
            return;

        string s(fname);
        size_t pos=s.find_last_of('.');
        if (pos!=-1)
            s=s.substr(0,pos);
        s+=".trilist";

        FILE* f=fopen(s.c_str(),"wt");

        fprintf(f,"Submeshes %i\n",mesh->getCoreSubmeshCount());

        for (int i=0; i<mesh->getCoreSubmeshCount(); i++)
        {
            CalCoreSubmesh& submesh=*mesh->getCoreSubmesh(i);
            vector<Face> faces=submesh.getVectorFace();
            vector<TriList> lists;

            totalfaces+=faces.size();

            while (faces.size())
                lists.push_back(MakeList(faces));

            totallists+=lists.size();

            fprintf(f,"Lists %i\n",lists.size());
            for (unsigned int i=0; i<lists.size(); i++)
            {
                TriList& tris=lists[i];
                totallistlength+=tris.size();

                fprintf(f," Size %i\n",tris.size());

                for (TriList::iterator iter=tris.begin(); iter!=tris.end(); iter++)
                {
                    int i=*iter;
                    fprintf(f," %i",i);
                }
                fprintf(f,"\n");
            }
        }
        fclose(f);
    }
}

void MakeLists2(const char* fname);

int main(int argc,char* args[])
{
    for (int i=1; i<argc; i++)
    {
        //one::MakeLists(args[i]);
        MakeLists2(args[i]);
    }

    /*cout << "Total faces: " << totalfaces << endl;
    cout << "Total vertices: " << totalfaces*3 << endl;
    cout << "Total lists: " << totallists << endl;
    cout << "Average list length: " << float(totallistlength)/totallists << endl;
    cout << "Total vertex count in lists: " << totallistlength << endl;

    float f=float(totallistlength)/float(totalfaces*3);
    int p=int(f*100);

    cout << p << "%" << endl;*/
}