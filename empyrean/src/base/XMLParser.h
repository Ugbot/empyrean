#ifndef PYR_XML_PARSER_H
#define PYR_XML_PARSER_H


#include <map>
#include <stack>
#include <string>
#include <vector>
#include <expat.h>
#include "Error.h"


namespace pyr {

    class XMLNode {
    public:
        XMLNode(const std::string& name = "") {
            _name = name;
            _isText = false;
        }
        
        /// Deletes children too...
        ~XMLNode() {
            for (size_t i = 0; i < _children.size(); ++i) {
                delete _children[i];
            }
        }
        
        void setName(const std::string& name) { _name = name; }
        std::string getName() const           { return _name; }
        
        bool isText() const         { return _isText; }
        void setIsText(bool isText) { _isText = isText; }
        
        void setText(const std::string& text) { _text = text;  }
        const std::string& getText() const    { return _text;  }
        void addText(const std::string& text) { _text += text; }
        
        void setAttr(const std::string& key, const std::string& value) {
            _attrs[key] = value;
        }
        bool hasAttr(const std::string& key) {
            return _attrs.count(key) > 0;
        }
        std::string getAttr(const std::string& key) {
            return (hasAttr(key) ? _attrs[key] : "");
        }
        
        void addChild(XMLNode* child)     { _children.push_back(child); }
        size_t getChildCount() const      { return _children.size(); }
        XMLNode* getChild(size_t i) const { return _children[i]; }
        
    private:
        std::string _name;
        bool _isText;
        std::string _text;
        std::map<std::string, std::string> _attrs;
        std::vector<XMLNode*> _children;
    };
    

    PYR_DEFINE_RUNTIME_ERROR(XMLParseError);    
    

    class XMLParser {
    public:
        XMLParser();
        ~XMLParser();
        
        XMLNode* parse(const std::string& filename);
    
    private:
        XMLNode* finish();
        
        void onStartElement(const XML_Char* name, const XML_Char** attrs);
        void onEndElement(const XML_Char* name);
        void onCharData(const XML_Char* c, int len);
    
        static void onStartElement(
            void* opaque, const XML_Char* name, const XML_Char** attrs);
        static void onEndElement(void* opaque, const XML_Char* name);
        static void onCharData(void* opaque, const XML_Char* c, int len);
    
        XML_Parser _parser;
        XMLNode* _currentRoot;
        std::stack<XMLNode*> _nodeStack;
        XMLNode* _lastTextNode;
    };

}


#endif
