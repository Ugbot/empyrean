#ifndef TRILIST_H
#define TRILIST_H

#include <vector>

typedef std::vector<std::vector<int> > TriList;

std::vector<TriList> LoadTriList(const char* fname);

#endif