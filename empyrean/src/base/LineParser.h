#ifndef PYR_LINE_PARSER_H
#define PYR_LINE_PARSER_H


#include "Types.h"


namespace pyr {

    class File;

    class LineParser {
    public:
        LineParser(File* file) {
            _file = file;
            _start = 0;
            _end = 0;
        }

        bool readLine(string& line);

    private:
        static const int BUFFER_SIZE = 4096;

        File* _file;
        unsigned _start;
        unsigned _end;
        char _buffer[BUFFER_SIZE];
    };

}


#endif
