#ifndef PYR_MODEL_H
#define PYR_MODEL_H

class CalCoreModel;
class CalModel;

namespace pyr {
    /** Encapsulates a 3D model.
     *
     * This doesn't represent a single model file; that's what CalCoreModel is for.
     * (I don't see a compelling reason to write a wrapper for that as well)
     * This represents a single instance of such a model file.
     *
     * It's a pretty thin abstraction, really.  It directly exposes both the CalCoreModel
     * and the CalModel, because their interfaces are pretty simple and as is.
     * We'll want to add higher level abstraction, like being able to say what
     * kind of equipment/weapon(s) a model has.
     */
    class Model {
    private:
        /*
         * These are pointers almost solely so that I don't have to #include
         * cal3d.h in the header, which would not be good for compile times.
         * (cal3d.h includes about 20 files of its own)  Of course, this means
         * that you have to include it yourself in any source file that uses
         * these classes, so maybe it's not worth it.  Time will tell.
         */
        CalCoreModel* _coremodel;
        CalModel* _model;
        // We'll probably want to store information on how this particular model
        // is skinned, and so on.

    public:

        Model(const std::string& fname);
        ~Model();

        CalCoreModel& getCoreModel();
        CalModel& getModel();

        void update(float timedelta);
    };
};

#endif
