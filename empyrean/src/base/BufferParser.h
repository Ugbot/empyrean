#ifndef PYR_BUFFER_PARSER_H
#define PYR_BUFFER_PARSER_H


#include <prnetdb.h>
#include <gmtl/Vec.h>
#include "Types.h"
#include "Utility.h"


namespace pyr {

    class BufferParser {
    public:
        BufferParser(int size, const void* bytes) {
            _size = size;
            _position = 0;
            _bytes = (u8*)bytes;
            _passedEnd = false;
        }
        
        bool passedEnd() {
            return _passedEnd;
        }

        void read(u8* p, int size) {
            if (size + _position > _size) {
                _passedEnd = true;
                _position = _size;
            } else {
                memcpy(p, _bytes + _position, size);
                _position += size;
            }
        }
        
        void read(std::string& s, int size) {
            ScopedArray<char> str(new char[size + 1]);
            memset(str.get(), 0, size + 1);
            read((u8*)str.get(), size);
            s = str.get();
        }
        
        void read(u8& u) {
            read(&u, sizeof(u));
        }
        
        void read(u16& u) {
            read((u8*)&u, sizeof(u));
            u = PR_ntohs(u);
        }
        
        void read(u32& u) {
            read((u8*)&u, sizeof(u));
            u = PR_ntohl(u);
        }
        
        void read(float& f) {
            read(*(u32*)&f);
        }
        
        void read(gmtl::Vec2f& v) {
            read(v[0]);
            read(v[1]);
        }
        
    private:
        int _size;
        int _position;
        u8* _bytes;
        
        bool _passedEnd;
    };

}


#endif
