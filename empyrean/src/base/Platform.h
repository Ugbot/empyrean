#ifndef PYR_PLATFORM_H
#define PYR_PLATFORM_H


namespace pyr {

    /**
     * This gives an absolute path, or a relative path from the
     * startup directory to the directory in which the executable
     * resides.
     */
    std::string getStartDirectory(int argc, char* argv[]);

    /// chdir to the directory in which the current executable resides.
    void setStartDirectory(int argc, char* argv[]);

}


#endif
