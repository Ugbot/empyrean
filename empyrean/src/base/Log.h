#ifndef PYR_LOG_H
#define PYR_LOG_H

#include <fstream>
#include "Error.h"
#include "Singleton.h"
#include <string>

namespace pyr
{
	PYR_DEFINE_RUNTIME_ERROR(LOG_FILE_OPEN_FAILURE);

	class Log
	{
		PYR_DECLARE_SINGLETON(Log)
	
		Log();
		~Log();

	public:
	
		void open(std::string filename);
		bool write(std::string message);
		void close();

	private:
		std::ofstream _stream;
	};

	inline void writeLog(std::string message)
	{
		the<Log>().write(message);
	}
};

#endif