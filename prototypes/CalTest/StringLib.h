#ifndef STRINGLIB_H
#define STRINGLIB_H

#include <string>
#include <vector>

// bad name?  I think so.  But everybody else is afraid of doing exactly this, so it's probably
// pretty safe, as long as I'm the only one with the odacity to do this.
namespace str
{
    void trim(std::string& s)
    {
        for (unsigned int i=0; i<s.length(); i++)
            if (s[i]!=' ')
            {
                s=s.substr(i);
                break;
            }
        for (int i=s.length()-1; i>=0; i++)
        {
            if (s[i]!=' ')
            {
                s=s.substr(0,i);
                return;
            }
        }
    }

    std::vector<std::string> split(const std::string& s,const std::string& delimiters=" \n\r\t")
    {
        std::vector<std::string> sv;

        unsigned int p=0;
        int pos=0;
        for (unsigned int i=0; i<s.length(); i++)
        {
            if ((pos=delimiters.find(s[i]))!=-1)
            {
                std::string st=s.substr(p,i-p);
                if (st.length()>0)
                    sv.push_back(st);
                p=i+1;
                i++;
            }
        }

        sv.push_back(s.substr(p));

        return sv;
    }
};

#endif