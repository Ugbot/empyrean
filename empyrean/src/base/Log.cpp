#include "Log.h"

PYR_DEFINE_SINGLETON(pyr::Log);

pyr::Log::Log() {}

pyr::Log::~Log()
{
	close();
}

void pyr::Log::open(std::string filename)
{
	// Open the file
	_stream.open(filename.c_str(), std::ios::out);
	if (_stream.bad())
		throw LOG_FILE_OPEN_FAILURE("Error opening file: " + filename);
}

bool pyr::Log::write(std::string message)
{
	// If a file is not open, open the default one.
	if (!_stream.is_open())
		open("default.log");

	// If there is a mesaage passed in, put it
	// in the file.
	if (message.c_str())
	{
		_stream << message.c_str() << std::endl;
		return true;
	}
	else
		return false;
}

void pyr::Log::close()
{
	// Close the file if needs be
	if (_stream.is_open()) _stream.close();
}
