#ifndef PYR_FILE_H
#define PYR_FILE_H


#include "Error.h"
#include "Types.h"


namespace pyr {

    PYR_DEFINE_RUNTIME_ERROR(FileError);

    class File {
    public:
        enum From {
            BEGIN,
            CURRENT,
            END,
        };

        virtual ~File() { }

        virtual size_t read(void* buffer, size_t count) = 0;
        virtual size_t write(const void* buffer, size_t count) = 0;
        
        virtual u64 getLength() = 0;
        virtual u64 getPosition() = 0;
        virtual bool setPosition(u64 position, From from) = 0;
    };

    File* openFile(const string& filename);

}


#endif
