
#include "TriList.h"
#include <sstream>
#include <fstream>
#include <string.h>

using namespace std;

vector<TriList> LoadTriList(const char* fname)
{
    ifstream file(fname);
    vector<TriList> tris;

    stringstream ss;
    
    while (file.good())
    {
        char c[1024];
        file.getline(c,1023);
        ss << c << ' ';
    }
    file.close();

    string s;
    ss >> s;
    if (s!="Submeshes")
        throw std::runtime_error("LoadTriList: submeshes");

    ss >> s;
    int nSubs=atoi(s.c_str());

    tris.resize(nSubs);
    for (int i=0; i<nSubs; i++)
    {
        ss >> s;
        if (s!="Strips")
            throw std::runtime_error("LoadTriList: lists");

        ss >> s;
        int nLists=atoi(s.c_str());
        tris[i].resize(nLists);

        for (int j=0; j<nLists; j++)
        {
            ss >> s;
            if (s != "Vertices")
                throw std::runtime_error("LoadTriList: vertices");

            ss >> s;
            int nTris=atoi(s.c_str());
            tris[i][j].reserve(nTris);
            for (int k=0; k<nTris; k++)
            {
                ss >> s;
                tris[i][j].push_back(atoi(s.c_str()));
            }
        }
    }

    return tris;
}