#include <string>
#include <vector>

#include <stdarg.h>

namespace pyr {

    using std::string;
    using std::vector;
    
    string itos(int i) {
        char str[80];
        sprintf(str, "%d", i);
        return str;
    }

    string trimString(const string& s) {
        string t;

        // Find the first nonwhitespace character
        for (unsigned int i = 0; i < s.length(); i++) {
            if (s[i] != ' ') {
                t = s.substr(i);
                break;
            }
        }

        // Find the last nonwhitespace character
        for (int i = int(t.length() - 1); i >= 0; i++) {
            if (t[i] != ' ') {
                t = t.substr(0,i);
                return t;
            }
        }

        // if we've made it this far, then every character in the
        // string is whitespace.
        return "";
    }

    vector<string> splitString(
        const string& s,
        const string& delimiters)
    {
        vector<string> sv;
        string::size_type p = 0;
        string::size_type pos = 0;

        for (string::size_type i = 0; i < s.length(); i++) {
            if (( pos=delimiters.find(s[i]) ) != string::npos) {
                string st = s.substr(p, i - p);
                if (st.length() > 0) {
                    sv.push_back(st);
                }

                p = i + 1;
                i++;
            }
        }

        sv.push_back(s.substr(p));      // Push whatever remains

        return sv;
    }

    string stripExtension(const string& s) {
        string::size_type p = s.rfind('.');
        if (p != string::npos) {
            return s.substr(0,p);
        } else {
            return s;
        }
    }

    string getExtension(const string& s) {
        string::size_type p = s.rfind('.');
        if (p != string::npos) {
            return s.substr(p);
        } else {
            return "";
        }
    }

    string getPath(const string& s) {
        string::size_type p = s.rfind('/');
        if (p != string::npos) {
            return s.substr(0, p + 1);
        } else {
            return "";
        }
    }

    string getFilename(const string& s) {
        string::size_type p = s.rfind('/');
        if (p != string::npos) {
            return s.substr(p + 1);
        } else {
            return s;
        }
    }

    string joinPath(const string& s1, const string& s2) {
        if (s1.empty()) return s2;
        if (s2.empty()) return s1;

        if (s1[s1.size() - 1] == '/') {
            if (s2[0] == '/') {
                return s1 + s2.substr(1);
            } else {
                return s1 + s2;
            }
        } else {
            if (s2[0] == '/') {
                return s1 + s2;
            } else {
                return s1 + "/" + s2;
            }
        }
    }

    bool fileExists(const string& path) {
        FILE* file = fopen(path.c_str(), "rb");
        if (file) {
            fclose(file);
            return true;
        } else {
            return false;
        }
    }

    string va(const char* s, ...) {
        char temp[1024];
        va_list lst;
        
        va_start(lst, s);
        vsprintf(temp, s, lst);
        va_end(lst);

        return temp;
    }
};
