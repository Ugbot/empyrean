#ifndef PYR_APPEARANCE_FACTORY_H
#define PYR_APPEARANCE_FACTORY_H


#include "Types.h"


namespace pyr {

    class ClientAppearance;

    /**
     * Instantiates an appearance from the type 'name'.  Returns a default
     * implementation of an appearance if the name isn't understood.
     *
     * This function will not return a null pointer.
     */
    ClientAppearance* instantiateAppearance(const string& name,
                                            const string& resource = "");

}


#endif
