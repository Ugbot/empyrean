#include "Log.h"
#include "Platform.h"
using namespace std;
using namespace pyr;


Logger& root = Logger::get("");
Logger& fooLogger = Logger::get("foo");
Logger& barLogger = Logger::get("bar");
Logger& fooBazLogger = Logger::get("foo.baz");
Logger& barBazLogger = Logger::get("bar.baz");


void test(Logger& logger) {
    // assert that Logger::get("") == Logger::get(".");
    
    logger.log(VERBOSE, logger.getName() + ": VERBOSE");
    logger.log(INFO,    logger.getName() + ": INFO");
    logger.log(WARN,    logger.getName() + ": WARN");
    logger.log(ERROR,   logger.getName() + ": ERROR");
    logger.log(FATAL,   logger.getName() + ": FATAL");
}


int main(int argc, char** argv) {
    string startDirectory = getStartDirectory(argc, argv);
    initializeLog(
        startDirectory + "/testLog.log",
        startDirectory + "/testLog.log.config");

    PYR_LOG_SCOPE(root, FATAL, "root - LoggingTest");
    
    test(root);
    test(fooLogger);
    test(barLogger);
    test(fooBazLogger);
    test(barBazLogger);
    
    Logger& root1 = Logger::get("");
    Logger& root2 = Logger::get(".");
    Logger& root3 = Logger::get("");
    PYR_ASSERT(&root1 == &root2 && &root2 == &root3,
               "'', '.', and '..' aren't equivalent");
}
