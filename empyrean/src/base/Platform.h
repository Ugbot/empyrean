#ifndef PYR_PLATFORM_H
#define PYR_PLATFORM_H


namespace pyr {

    /**
     * chdir to the directory in which the current executable resides.
     */
    void setStartDirectory(int argc, char* argv[]);

}


#endif
