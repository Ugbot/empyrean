#include "File.h"
#include "LineParser.h"


namespace pyr {

    bool LineParser::readLine(string& line) {
        line.clear();

        while (true) {
            // Refill buffer if it's empty.
            if (_start == _end) {
                _start = 0;
                _end = _file->read(_buffer, BUFFER_SIZE);
                if (_end == 0) {
                    return false;
                }
            }

            // Find end of line in buffer.
            unsigned endOfLine = _start;
            while (endOfLine < _end && _buffer[endOfLine] != '\n') {
                ++endOfLine;
            }

            // Add line to output string.
            line.append(_buffer + _start, _buffer + endOfLine);

            // If we hit the end of the line, return.
            if (_buffer[endOfLine] == '\n') {
                
                // Remove starting '\r' if it's there.
                if (!line.empty() && line[0] == '\r') {
                    line.erase(line.begin(), line.begin() + 1);
                }

                // Remove trailing '\r' if it's there.
                if (!line.empty() && line[line.size() - 1] == '\r') {
                    line.resize(line.size() - 1);
                }

                _start = endOfLine + 1;
                return true;
            } else {
                _start = endOfLine;
            }
        }
    }

}
