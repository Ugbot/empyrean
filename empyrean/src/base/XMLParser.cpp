#include "Debug.h"
#include "XMLParser.h"


namespace pyr {

    XMLParser::XMLParser() {
        _parser = XML_ParserCreate(0);
        if (!_parser) {
            throw XMLParseError("Creating parser failed.");
        }
        
        XML_SetUserData(_parser, this);
        XML_SetElementHandler(_parser, onStartElement, onEndElement);
        XML_SetCharacterDataHandler(_parser, onCharData);

        _currentRoot = 0;
        _lastTextNode = 0;
    }
    
    XMLParser::~XMLParser() {
        XML_ParserFree(_parser);
    }
    
    XMLNode* XMLParser::parse(const std::string& filename) {
        // XXX need an exception-safe smart pointer around FILE*
        FILE* file = fopen(filename.c_str(), "rb");
        if (!file) {
            throw XMLParseError("Opening file failed.");
        }
        
        static const int BUFFER_SIZE = 4096;
        
        for (;;) {
            char buffer[1024];
            int read = fread(buffer, 1, BUFFER_SIZE, file);
            
            XML_Status status = XML_Parse(_parser, buffer, read, 0);
            if (status != XML_STATUS_OK) {
                fclose(file);
                return finish();
            }
            
            if (read != BUFFER_SIZE) {
                break;
            }
        }
        
        XML_Status status = XML_Parse(_parser, 0, 0, 1);
        if (status != XML_STATUS_OK) {
            fclose(file);
            return finish();
        }
        
        fclose(file);
        return finish();
    }
    
    XMLNode* XMLParser::finish() {
        XMLNode* node = _currentRoot;
        _currentRoot = 0;
        _lastTextNode = 0;
        
        // no clear() method :P
        while (!_nodeStack.empty()) {
            _nodeStack.pop();
        }
        
        return node;
    }
    
    void XMLParser::onStartElement(
        const XML_Char* name, const XML_Char** attrs)
    {
        _lastTextNode = 0;
    
        XMLNode* node = new XMLNode(name);
        while (attrs[0]) {
            node->setAttr(attrs[0], attrs[1]);
            attrs += 2;
        }
    
        if (!_currentRoot) {
            _currentRoot = node;
        } else {
            PYR_ASSERT(!_nodeStack.empty(), "Node stack shouldn't be empty!");
            _nodeStack.top()->addChild(node);
        }
        
        _nodeStack.push(node);
    }
    
    void XMLParser::onEndElement(const XML_Char* name) {
        _lastTextNode = 0;
        PYR_ASSERT(!_nodeStack.empty(), "Node stack shouldn't be empty!");
        _nodeStack.pop();
    }
    
    void XMLParser::onCharData(const XML_Char* c, int len) {
        if (!_nodeStack.empty()) {
            // A contiguous block of text may be split into multiple calls
            // to this handler, so combine them if possible.
            if (_lastTextNode) {
                _lastTextNode->addText(std::string(c, len));
            } else {
                XMLNode* node = new XMLNode;
                node->setIsText(true);
                node->setText(std::string(c, len));
                
                _nodeStack.top()->addChild(node);
            }
        }
    }
    
    void XMLParser::onStartElement(
        void* opaque, const XML_Char* name, const XML_Char** attrs)
    {
        XMLParser* parser = (XMLParser*)opaque;
        parser->onStartElement(name, attrs);
    }
    
    void XMLParser::onEndElement(void* opaque, const XML_Char* name) {
        XMLParser* parser = (XMLParser*)opaque;
        parser->onEndElement(name);
    }
    
    void XMLParser::onCharData(void* opaque, const XML_Char* c, int len) {
        XMLParser* parser = (XMLParser*)opaque;
        parser->onCharData(c, len);
    }

}
