#include <fstream>
#include <sstream>
#include <max.h>
#include <commctrl.h>


// I'm not quite ready to depend on empyrean's base library yet...
std::string trimString(const std::string& s) {
    std::string t = s;

    // Find the first nonwhitespace character
    for (size_t i = 0; i < t.length(); i++) {
        if (!isspace(t[i])) {
            t = t.substr(i);
            break;
        }
    }

    // Find the last nonwhitespace character
    for (int i = int(t.length() - 1); i >= 0; i--) {
        if (!isspace(t[i])) {
            t = t.substr(0,i+1);
            return t;
        }
    }

    // if we've made it this far, then every character in the
    // string is whitespace.
    return "";
}


class Exporter : public SceneExport {
public:
    int ExtCount()                  { return 1; }
    const TCHAR* Ext(int n)         { return "meta"; }
    const TCHAR* LongDesc()         { return ShortDesc(); }
    const TCHAR* ShortDesc()        { return "Empyrean Map Metadata"; }
    const TCHAR* AuthorName()       { return "Empyrean Team"; }
    const TCHAR* CopyrightMessage() { return "Empyrean Team (c) 2004"; }
    const TCHAR* OtherMessage1()    { return ""; }
    const TCHAR* OtherMessage2()    { return ""; }
    unsigned     Version()          { return 1; }

    void ShowAbout(HWND parent) {
        MessageBox(parent, CopyrightMessage(), "About Empyrean Map Metadata Exporter", MB_OK);
    }

    int DoExport(const TCHAR* name, ExpInterface* /*ei*/, Interface* i, BOOL /*suppressPrompts*/, DWORD /*options*/) {
        std::ofstream out(name);
        if (!out) {
            return IMPEXP_FAIL;
        }

        out << "<map-metadata>\n";
        walk(out, i->GetRootNode(), i->GetTime());
        out << "</map-metadata>\n";

        return IMPEXP_SUCCESS;
    }

    void walk(std::ostream& out, INode* node, TimeValue time) {
        if (!node) {
            return;
        }

        Matrix3 m = node->GetNodeTM(time);
        Point3 t = m.GetTrans();

        out << "  <node name=\"" << node->GetName() <<
               "\" position=\"" << t.x << " " << t.y << " " << t.z << "\">\n";

        TSTR data;
        node->GetUserPropBuffer(data);
        std::stringstream parser(data.data() ? data.data() : "");
        std::string line;
        while (getline(parser, line)) {
            std::string::size_type eq = line.find('=');
            if (eq == std::string::npos) {
                continue;
            }
            std::string key(line.begin(), line.begin() + eq);
            std::string value(line.begin() + eq + 1, line.end());
            out << "    <property key=\"" << trimString(key)
                << "\" value=\"" << trimString(value) << "\"/>\n";
        }

        out << "  </node>\n";
        
        // walk children
        for (int i = 0; i < node->NumberOfChildren(); ++i) {
            walk(out, node->GetChildNode(i), time);
        }
    }

};


class ExporterClassDesc : public ClassDesc {
public:
    int IsPublic()                 { return 1;                               }
    void* Create(BOOL /*loading*/) { return new Exporter;                    }
    const TCHAR* Category()        { return _T("Game Utilities");            }
    Class_ID ClassID()             { return Class_ID(0xa2009d6, 0x46551261); }
    SClass_ID SuperClassID()       { return SCENE_EXPORT_CLASS_ID;           }
    const TCHAR* ClassName()       { return _T("Empyrean Map Metadata Export");  }
};


BOOL WINAPI DllMain(HINSTANCE instance, ULONG /*reason*/, LPVOID /*reserved*/) {
    static bool controlsInit = false;
    if (!controlsInit) {
        controlsInit = true;

        InitCustomControls(instance);
        InitCommonControls();
    }

    return TRUE;
}

extern "C" __declspec(dllexport) int LibNumberClasses() {
    return 1;
}

extern "C" __declspec(dllexport) ClassDesc *LibClassDesc(int id) {
    static ExporterClassDesc desc;
    return &desc;
}

extern "C" __declspec(dllexport) const TCHAR *LibDescription() {
    return _T("Empyrean Map Metadata Exporter");
}

extern "C" __declspec(dllexport) ULONG LibVersion() {
    return VERSION_3DSMAX;
}
