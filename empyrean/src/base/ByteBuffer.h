#ifndef PYR_BYTE_BUFFER_H
#define PYR_BYTE_BUFFER_H


#include <algorithm>
#include <stdlib.h>
#include <string.h>
#include <prnetdb.h>
#include "Types.h"
#include "Utility.h"


namespace pyr {

    class ByteBuffer {
    public:
        ByteBuffer() {
            _capacity = 1024;
            _buffer = (u8*)malloc(_capacity);
            _size = 0;
        }
        
        ~ByteBuffer() {
            _buffer = (u8*)realloc(_buffer, 0);
            _size = 0;
            _capacity = 0;
        }
        
        void add_string(const std::string& s, int size) {
            ScopedArray<char> str(new char[size + 1]);
            memset(str.get(), 0, size + 1);
            memcpy(str.get(), s.c_str(), std::min<int>(s.length(), size));
            add(str.get(), size);
        }
        
        void add_u16(u16 value) {
            value = PR_htons(value);
            add(&value, sizeof(value));
        }
        
        void add_u32(u32 value) {
            value = PR_htonl(value);
            add(&value, sizeof(value));
        }
        
        void add_float(float v) {
            u32* p = (u32*)&v;
            add_u32(*p);
        }
        
        /// Add bytes to the end of the buffer.
        void add(const void* buffer, int size);
        
        void* getBuffer() {
            return _buffer;
        }
        
        const void* getBuffer() const {
            return _buffer;
        }
        
        int getSize() const {
            return _size;
        }
        
        /// Removes a chunk of the buffer from the front.
        void consumeFront(int amount);
        
    private:
        u8* _buffer;
        int _size;
        int _capacity;
    };

}


#endif
