#ifndef PYR_BUFFER_PARSER_H
#define PYR_BUFFER_PARSER_H


#include <prnetdb.h>
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
        
        std::string read_string(int size) {
            ScopedArray<char> str(new char[size + 1]);
            memset(str.get(), 0, size + 1);
            read((u8*)str.get(), size);
            return str.get();
        }
        
        u16 read_u16() {
            u16 u;
            read((u8*)&u, sizeof(u));
            return PR_ntohs(u);
        }
        
        u32 read_u32() {
            u32 u;
            read((u8*)&u, sizeof(u));
            return PR_ntohl(u);
        }
        
        float read_float() {
            u32 u = read_u32();
            return *(float*)&u;
        }
        
    private:
        int _size;
        int _position;
        u8* _bytes;
        
        bool _passedEnd;
    };

}


#endif
