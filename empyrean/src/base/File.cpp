#include <stdio.h>
#include "File.h"
#include "Log.h"


namespace pyr {

    namespace {
        Logger& _logger = Logger::get("pyr.File");
    }

    class CFile : public File {
    public:
        CFile(const string& filename) {
            _handle = fopen(filename.c_str(), "rb");
            if (!_handle) {
                PYR_THROW(FileError, "Cannot open file '" << filename << "'");
            }
        }

        CFile(FILE* handle)
        : _handle(handle) {
        }

        ~CFile() {
            fclose(_handle);
        }

        size_t read(void* buffer, size_t count) {
            return fread(buffer, 1, count, _handle);
        }

        size_t write(const void* buffer, size_t count) {
            return fwrite(buffer, 1, count, _handle);
        }

        u64 getLength() {
            u64 currentPosition = getPosition();
            if (!setPosition(0, END)) {
                PYR_LOG(_logger, WARN, "CFile::setPosition() failed in getLength()");
                setPosition(currentPosition, BEGIN);
                return 0;
            }
            u64 end = getPosition();
            setPosition(currentPosition, BEGIN);
            return end;
        }

        u64 getPosition() {
            long position = ftell(_handle);
            if (position == -1) {
                PYR_LOG(_logger, WARN, "ftell() returned -1");
            }
            return position;
        }

        bool setPosition(u64 position, From from) {
            int origin;
            switch (from) {
                case BEGIN:   origin = SEEK_SET; break;
                case CURRENT: origin = SEEK_CUR; break;
                case END:     origin = SEEK_END; break;
                default:      PYR_ASSERT(false, "Invalid From value given to CFile::setPosition");
            }
            int result = fseek(_handle, static_cast<long>(position), origin);
            return result == 0;
        }

    private:
        FILE* _handle;
    };

    File* openFile(const string& filename) {
        return new CFile(filename);
    }

}
