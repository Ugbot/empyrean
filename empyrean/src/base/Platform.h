#ifndef PYR_PLATFORM_H
#define PYR_PLATFORM_H


namespace pyr {

    std::string getCurrentDirectory();
    bool setCurrentDirectory(const std::string& dir);

    /**
     * This gives an absolute path, or a relative path from the
     * startup directory to the directory in which the executable
     * resides.
     */
    std::string getStartDirectory(const char* argv0);

    /// chdir to the directory in which the current executable resides.
    void setStartDirectory(const char* argv0);

}


#endif
