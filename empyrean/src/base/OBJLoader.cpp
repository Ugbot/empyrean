#include <fstream>
#include <sstream>
#include "Log.h"
#include "Map.h"
#include "OBJLoader.h"
#include "PathHandler.h"
using namespace std;


namespace pyr {

    /// http://zoo.cs.yale.edu/classes/cs490/00-01a/mcnamara.antoine.amm43/mtl.html
    struct OBJMaterial {
        OBJMaterial() {
            ambient = Vec3f(0.2f, 0.2f, 0.2f);
            diffuse = Vec3f(0.8f, 0.8f, 0.8f);
            specular = Vec3f(1, 1, 1);
            alpha = 1;
            shininess = 0;
            texture_scale = Vec2f(1, 1);
        }

        string name;
        Vec3f ambient;
        Vec3f diffuse;
        Vec3f specular;
        float alpha;
        float shininess;
        string texture;
        Vec2f texture_offset;
        Vec2f texture_scale;
    };

    class MaterialLibrary {
    public:
        void loadFrom(const string& filename) {
            ifstream file(filename.c_str());
            if (!file) {
                PYR_LOG() << "Warning: OBJ material file not found: " << filename;
                return;
            }

            OBJMaterial current;

            string line;
            while (getline(file, line)) {
                istringstream ss(line);

                string command;
                if (ss >> command) {
                    if (command == "newmtl") {
                        if (!current.name.empty()) {
                            _materials.push_back(current);
                            current = OBJMaterial();
                        }
                        ss >> current.name;
                    } else if (command == "Ka") {
                        float r, g, b;
                        if (ss >> r >> g >> b) {
                            current.ambient = Vec3f(r, g, b);
                        }
                    } else if (command == "Kd") {
                        float r, g, b;
                        if (ss >> r >> g >> b) {
                            current.diffuse = Vec3f(r, g, b);
                        }
                    } else if (command == "Ks") {
                        float r, g, b;
                        if (ss >> r >> g >> b) {
                            current.specular = Vec3f(r, g, b);
                        }
                    } else if (command == "d") {
                        float k;
                        if (ss >> k) {
                            current.alpha = k;
                        }
                    } else if (command == "Ns") {
                        float k;
                        if (ss >> k) {
                            current.shininess = k;
                        }
                    } else if (command == "map_Kd") {
                        string arg;
                        while (ss >> arg) {
                            if (arg == "-o") {
                                float ox, oy, oz;
                                if (ss >> ox >> oy >> oz) {
                                    current.texture_offset = Vec2f(ox, oy/*, oz*/);
                                }
                            } else if (arg == "-s") {
                                float sx, sy, sz;
                                if (ss >> sx >> sy >> sz) {
                                    current.texture_scale = Vec2f(sx, sy/*, sz*/);
                                }
                            } else {
                                PYR_LOG() << "Material referencing texture: " << arg;
                                current.texture = arg;
                            }
                        }

                    }
                }
            }

            if (!current.name.empty()) {
                _materials.push_back(current);
            }
        }

        OBJMaterial* findMaterial(const string& name) {
            for (size_t i = 0; i < _materials.size(); ++i) {
                if (_materials[i].name == name) {
                    return &_materials[i];
                }
            }
            return 0;
        }

        MaterialPtr buildMaterial(PathHandler& ph, const string& name) {
            OBJMaterial* om = findMaterial(name);
            if (!om) {
                // Build a default material.
                MaterialPtr m = new Material;
                m->diffuse = Vec3f(1, 1, 1);
                return m;
            }

            MaterialPtr m = new Material;
            m->diffuse = om->diffuse;
            if (!om->texture.empty()) {
                m->texture = ph.findFile(om->texture);
                m->texture_offset = om->texture_offset;
                m->texture_scale  = om->texture_scale;
                PYR_LOG() << "Texture found at: " << m->texture;
            }
            return m;
        }

    private:
        vector<OBJMaterial> _materials;
    };


    vector<string> splitVertexString(const string& s) {
        /// @todo These asserts should be run-time checks.

        string::size_type d1 = s.find('/');
        PYR_ASSERT(d1 != string::npos, "Syntax error in face specification");
        string::size_type d2 = s.find('/', d1 + 1);
        //PYR_ASSERT(d2 != string::npos, "Syntax error in face specification");

        vector<string> rv;
        if (d2 != string::npos) {
            rv.push_back(s.substr(0, d1));
            rv.push_back(s.substr(d1 + 1, d2 - d1 - 1));
            rv.push_back(s.substr(d2 + 1));
        } else {
            rv.push_back(s.substr(0, d1));
            rv.push_back(s.substr(d1 + 1));
            rv.push_back("");
        }
        return rv;
    }


    void parseFace(const string& si, const string& sj,
                   const string& sk, GeometryElement::Triangle& tri)
    {
        vector<string> v_si = splitVertexString(si);
        vector<string> v_sj = splitVertexString(sj);
        vector<string> v_sk = splitVertexString(sk);

        /// @todo These asserts should be run-time checks.
        PYR_ASSERT(v_si.size() == 3, "Syntax error in vertex 1");
        PYR_ASSERT(v_sj.size() == 3, "Syntax error in vertex 2");
        PYR_ASSERT(v_sk.size() == 3, "Syntax error in vertex 3");

        tri.pos[0] = atoi(v_si[0].c_str()) - 1;
        tri.pos[1] = atoi(v_sj[0].c_str()) - 1;
        tri.pos[2] = atoi(v_sk[0].c_str()) - 1;

        tri.tc[0] = atoi(v_si[1].c_str()) - 1;
        tri.tc[1] = atoi(v_sj[1].c_str()) - 1;
        tri.tc[2] = atoi(v_sk[1].c_str()) - 1;

        tri.n[0] = atoi(v_si[2].c_str()) - 1;
        tri.n[1] = atoi(v_sj[2].c_str()) - 1;
        tri.n[2] = atoi(v_sk[2].c_str()) - 1;
    }

    bool isValidTriangle(const GeometryElement::Triangle& tri,
                         VertexArrayPtr vertexArray)
    {
        const int pos_count = static_cast<int>(vertexArray->positions.size());
        const int n_count   = static_cast<int>(vertexArray->normals.size());
        const int tc_count  = static_cast<int>(vertexArray->texCoords.size());

        bool rv = tri.pos[0] < pos_count && tri.pos[1] < pos_count && tri.pos[2] < pos_count &&
                  tri.n[0]   < n_count   && tri.n[1]   < n_count   && tri.n[2]   < n_count   &&
                  tri.tc[0]  < tc_count  && tri.tc[1]  < tc_count  && tri.tc[2]  < tc_count;

        // For debugging.
        //Vec3f pos = vertexArray->positions[tri.pos[0]];
        //Vec3f n   = vertexArray->normals[tri.n[0]];
        //Vec2f tc  = vertexArray->texCoords[tri.tc[0]];

        return rv;
    }

    Map* loadOBJFile(const string& filename) {
        PathHandler ph;
        ScopedPathSearch sps(ph, getPath(filename));

        ifstream file(ph.findFile(filename).c_str());
        if (!file) {
            PYR_LOG() << "Warning: OBJ file not found: " << filename;
            return 0;
        }

        MaterialLibrary mtllib;

        MaterialPtr currentMaterial;
        VertexArrayPtr vertexArray = new VertexArray;

        Map* map = new Map;

        GeometryElementPtr currentGeometry = new GeometryElement;

        string line;
        while (getline(file, line)) {
            istringstream ss(line);

            string command;
            if (ss >> command) {
                if (command == "mtllib") {
                    string mtlfile;
                    while (ss >> mtlfile) {
                        std::string found = ph.findFile(mtlfile);
                        PYR_LOG() << "Map referencing material library " << mtlfile
                                  << " found at: " << found;
                        mtllib.loadFrom(found);
                    }
                } else if (command == "usemtl") {
                    string material;
                    if (ss >> material) {
                        currentMaterial = mtllib.buildMaterial(ph, material);
                    }
                } else if (command == "g") {
                    if (!currentGeometry->triangles.empty()) {
                        currentGeometry->material = currentMaterial;
                        currentGeometry->vertexArray = vertexArray;
                        map->addElement(currentGeometry);
                    }
                    currentGeometry = new GeometryElement;

                    string name;
                    if (ss >> name) {
                        currentGeometry->name = name;
                    }
                } else if (command == "v") {
                    float x, y, z;
                    if (ss >> x >> y >> z) {
                        // notice: convert from max coordinates to empyrean coordinates here
                        vertexArray->positions.push_back(Vec3f(x, z, -y));
                    }
                } else if (command == "vn") {
                    float x, y, z;
                    if (ss >> x >> y >> z) {
                        // notice: convert from max coordinates to empyrean coordinates here
                        vertexArray->normals.push_back(Vec3f(x, z, y));
                    }
                } else if (command == "vt") {
                    float u, v;
                    if (ss >> u >> v) {
                        // notice: convert from max coordinates to empyrean coordinates here
                        vertexArray->texCoords.push_back(Vec2f(u, 1 - v));
                    }
                } else if (command == "f") {
                    vector<string> vertices;
                    string s;
                    while (ss >> s) {
                        vertices.push_back(s);
                    }

                    if (vertices.size() >= 3) {
                        string first = vertices[0];
                        string last  = vertices[1];
                        for (size_t i = 2; i < vertices.size(); ++i) {
                            string current = vertices[i];

                            GeometryElement::Triangle tri;
                            parseFace(first, last, current, tri);
                            if (isValidTriangle(tri, vertexArray)) {
                                currentGeometry->triangles.push_back(tri);
                            }

                            last = current;
                        }
                    }
                }
            }
        }

        if (!currentGeometry->triangles.empty()) {
            currentGeometry->material = currentMaterial;
            currentGeometry->vertexArray = vertexArray;
            map->addElement(currentGeometry);
        }

        return map;
    }

}
