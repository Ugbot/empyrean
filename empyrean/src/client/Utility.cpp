#include <string>
#include <vector>

namespace pyr {
    using std::string;
    using std::vector;

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
        for (int i = t.length()-1; i >= 0; i++) {
            if (t[i] != ' ') {
                t = t.substr(0,i);
                return t;
            }
        }

        return ""; // if we've made it this far, then every character in the string is whitespace.
    }

    vector<string> splitString(const string& s, const string& delimiters=" \n\r\t") {
        vector<string> sv;
        unsigned int p = 0;
        int pos = 0;

        for (unsigned int i = 0; i < s.length(); i++) {
            if (( pos=delimiters.find(s[i]) ) != -1) {
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

};