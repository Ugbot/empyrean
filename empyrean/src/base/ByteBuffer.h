#ifndef PYR_BYTE_BUFFER_H
#define PYR_BYTE_BUFFER_H


#include <stdlib.h>
#include <string.h>
#include "Types.h"


namespace pyr {

    class ByteBuffer {
    public:
        ByteBuffer() {
            _buffer = 0;
            _size = 0;
        }
        
        ~ByteBuffer() {
            _buffer = realloc(_buffer, 0);
            _size = 0;
        }
        
        void add(const void* buffer, int size) {
            _buffer = realloc(_buffer, _size + size);
            memcpy((u8*)_buffer + _size, buffer, size);
            _size += size;
        }
        
        void* getBuffer() {
            return _buffer;
        }
        
        const void* getBuffer() const {
            return _buffer;
        }
        
        int getSize() const {
            return _size;
        }
        
    private:
        void* _buffer;
        int   _size;
    };

}


#endif
