#ifndef PYR_PROFILER_H
#define PYR_PROFILER_H

#include <list>
#include <map>
#include <stack>
#include <string>
#include "RefCounted.h"
#include "RefPtr.h"
#include "Singleton.h"
#include "Utility.h"

namespace pyr {

    struct ProfileData {
        float time() const {
            return timePlusChildren - timeInChildren;
        }

        Zeroed<int>   runCount;          ///< Number of complete executions of this block.
        Zeroed<float> timeInChildren;    ///< Time spent only in children blocks.
        Zeroed<float> timePlusChildren;  ///< Time spent in this block including children blocks.
    };


    class ProfileBlock : public RefCounted {
    public:
        ProfileBlock(const std::string& name);

        const std::string& getName() const {
            return _name;
        }

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

        void nextFrame();

        /// Returns average time in this function over the last N frames.
        float getAverageTime() const;

        /// Returns average time in this function and children over the last N frames.
        float getAverageTotalTime() const;


        bool current;    ///< Are we currently in this block?
        float entryTime; ///< The time this block was entered.

        ProfileData total;
        /// Circular buffer of remembered frames.  The first one is always the newest.
        std::vector<ProfileData> lastFrames;

    private:
        std::string _name;
    };
    typedef RefPtr<ProfileBlock> ProfileBlockPtr;

    typedef std::map<std::string, ProfileBlockPtr> ProfileBlockMap;


    struct CallNode;
    typedef RefPtr<CallNode> CallNodePtr;
    typedef std::list<CallNodePtr> CallNodeList;

    /// Facilitates construction of a tree of calls.
    struct CallNode : public RefCounted {
        ProfileBlockPtr block;
        CallNodeList children;
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

        Profiler()  { }
        ~Profiler() { }

    public:
        const ProfileBlockMap& getBlockMap() const {
            return _blocks;
        }
        
        const CallNodeList& getLastCallTree() const {
            return _lastCallTree;
        }

        float getTotalTime() const {
            return _totalTime;
        }

        void beginBlock(const std::string& name);
        void endBlock();

        void nextFrame();

    private:
        void pushBlock(ProfileBlockPtr block);
        ProfileBlockPtr popBlock();

        /// Total time spent profiling.
        float _totalTime;

        /// Set of profiled blocks and their names.
        ProfileBlockMap _blocks;

        std::stack<CallNodePtr> _callStack;
        CallNodeList _callTree;
        CallNodeList _lastCallTree;
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
