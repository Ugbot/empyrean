#include <algorithm>
#include <string.h>
#include "ByteBuffer.h"


namespace pyr {

    void ByteBuffer::add(const void* buffer, int size) {
        int new_size = _size + size;
        
        bool do_realloc = false;
        while (_capacity < new_size) {
            _capacity *= 2;
            do_realloc = true;
        }
        if (do_realloc) {
            _buffer = (u8*)realloc(_buffer, _capacity);
        }
        
        memcpy(_buffer + _size, buffer, size);
        _size += size;
    }
    
    void ByteBuffer::consumeFront(int amount) {
        amount = std::min(amount, _size);
        memmove(_buffer, _buffer + amount, _size - amount);
        _size -= amount;
    }

}
