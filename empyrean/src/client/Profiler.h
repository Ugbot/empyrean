#ifndef PYR_PROFILER_H
#define PYR_PROFILER_H

#include <map>
#include <stack>
#include <string>
#include "Singleton.h"

namespace pyr {

    struct ProfileData {
        ProfileData() {
            runCount = 0;
            timeInChildren = 0;
            timePlusChildren = 0;
        }

        float time() {
            return timePlusChildren - timeInChildren;
        }

        int runCount;            ///< Number of complete executions of this block.
        float timeInChildren;    ///< Time spent only in children blocks.
        float timePlusChildren;  ///< Time spent in this block including children blocks.
    };


    struct ProfileBlock {
        static const int REMEMBERED_FRAMES = 20;

        void update(float dt) {
            update(dt, total);
            update(dt, lastFrames[0]);
        }

        void update(float dt, ProfileData& data) {
            data.runCount += 1;
            data.timePlusChildren += dt;
        }

        void updateParent(float dt) {
            updateParent(dt, total);
            updateParent(dt, lastFrames[0]);
        }

        void updateParent(float dt, ProfileData& data) {
            data.timeInChildren += dt;
        }

        void nextFrame() {
            for (int i = REMEMBERED_FRAMES - 1; i > 0; --i) {
                lastFrames[i] = lastFrames[i - 1];
            }
            lastFrames[0] = ProfileData();
        }

        bool current;    ///< Are we currently in this block?
        float entryTime; ///< The time this block was entered.

        ProfileData total;
        /// Circular buffer of remembered frames.  The first one is always the newest.
        ProfileData lastFrames[REMEMBERED_FRAMES];
    };


    /**
     * A Simple class for figuring out what's going on when, and for
     * how long.  Use PYR_PROFILE_BLOCK(name) instead of this class directly.
     *
     * @note  This class is not threadsafe.  Do not use it in different
     *        threads.
     */
    class Profiler {
        PYR_DECLARE_SINGLETON(Profiler)

        Profiler();
        ~Profiler();

    public:
        typedef std::map<std::string, ProfileBlock*> BlockMap;

        const BlockMap& getBlockMap() const {
            return _blocks;
        }

        float getTotalTime() const {
            return _totalTime;
        }

        void beginBlock(const std::string& name);
        void endBlock();

        void nextFrame();

    private:
        /// Total time spent profiling.
        float _totalTime;

        /// Set of profiled blocks and their names.
        BlockMap _blocks;
        
        std::stack<ProfileBlock*> _callStack;
    };


    /**
     * ProfileScope marks a block of code as being profiled under the
     * specified name.  Use the PYR_PROFILE_BLOCK(name) macro instead of
     * ProfileScope directly.
     */
    class ProfileScope {
    public:
        ProfileScope(const std::string& name) {
            the<Profiler>().beginBlock(name);
        }

        ~ProfileScope() {
            the<Profiler>().endBlock();
        }
    };

};

#if 1 || defined(DEBUG) || defined(_DEBUG)
#   define PYR_ENABLE_PROFILE
#endif

#ifdef PYR_ENABLE_PROFILE
#   define PYR_PROFILE_BLOCK(name) pyr::ProfileScope __profileBlockObject(name)
#else
#   define PYR_PROFILE_BLOCK(name)
#endif

#endif
