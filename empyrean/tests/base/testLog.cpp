#include "Log.h"
using namespace std;
using namespace pyr;


int main() {
    Logger& root = Logger::get("");
    Logger& fooLogger = Logger::get("foo");
    Logger& barLogger = Logger::get("bar");
    Logger& fooBarLogger = Logger::get("foo.bar");
    Logger& barFooLogger = Logger::get("bar.foo");
    
    root.setLevel(ERROR);
    fooLogger.setLevel(VERBOSE);
    
    PYR_LOG_SCOPE(root, FATAL, "LoggingTest");
    
    fooLogger.log(WARN, "fooLogger says WARNING!");
    barLogger.log(INFO, "barLogger says INFO!");
    fooBarLogger.log(FATAL, "ACK, DEATH - FATALITY");
    barFooLogger.log(ERROR, "barFooLogger says ERROR!");
    
    // assert that Logger::get("") == Logger::get(".");
}
