#ifndef PYR_APPEARANCE_FACTORY_H
#define PYR_APPEARANCE_FACTORY_H


#include <string>


namespace pyr {

    class ClientAppearance;

    /**
     * Instantiates an appearance from the type 'name'.  Returns a default
     * implementation of an appearance if the name isn't understood.
     *
     * This function will not return a null pointer.
     */
    ClientAppearance* instantiateAppearance(const std::string& name,
                                            const std::string& resource = "");

}


#endif
