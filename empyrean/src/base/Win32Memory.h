#ifndef PYR_WIN32_MEMORY_H
#define PYR_WIN32_MEMORY_H


#ifndef WIN32
#error Win32Memory.h requires Win32 API
#endif


#include <windows.h>


namespace pyr {

    /**
     * Implements a C++ allocator that uses the Win32 heap allocation
     * instead of malloc and free.  This lets us allocate memory in our
     * heap checker without checking the memory in the checker.  ;)
     *
     * Note: You should, in theory, be able to derive a custom allocator
     * from std::allocator to get most of the functionality.  However, I
     * ran into a strange bug in VC++ 7.1:
     * http://www.livejournal.com/users/aegisknight/90940.html
     */
    template<typename T>
    struct Win32Allocator {
        typedef size_t    size_type;
        typedef ptrdiff_t difference_type;
        typedef T*        pointer;
        typedef const T*  const_pointer;
        typedef T&        reference;
        typedef const T&  const_reference;
        typedef T         value_type;

        template<typename U>
        struct rebind {
            typedef Win32Allocator<U> other;
        };

        Win32Allocator() {}

        Win32Allocator(const Win32Allocator<T>&) {}

        template<typename U>
        Win32Allocator(const Win32Allocator<U>&) {}

        ~Win32Allocator() {}

              pointer address(      reference x) const { return &x; }
        const_pointer address(const_reference x) const { return &x; }
    
        pointer allocate(size_type count, const void* /*hint*/ = 0) {
            HANDLE heap = GetProcessHeap();
            LPVOID block = HeapAlloc(heap, 0, count * sizeof(T));
            if (!block) {
                throw std::bad_alloc();
            }
            return static_cast<pointer>(block);
        }
        
        void deallocate(pointer ptr, size_type /*count*/) {
            HANDLE heap = GetProcessHeap();
            HeapFree(heap, 0, LPVOID(ptr));
        }

        size_type max_size() const {
            // estimate maximum array size
            return (size_type)(-1) / sizeof(value_type);
        }

        void construct(pointer p, const_reference val) {
            new(p) value_type(val);
        }

        void destroy(pointer p) {
            p->~value_type();
        }
    };
    
    struct Win32Object {
        void* operator new(size_t size) {
            HANDLE heap = GetProcessHeap();
            LPVOID block = HeapAlloc(heap, 0, size);
            if (!block) {
                throw std::bad_alloc();
            }
            return block;
        }
        
        void operator delete(void* ptr) {
            HANDLE heap = GetProcessHeap();
            HeapFree(heap, 0, ptr);
        }
    };
    
}


#endif
