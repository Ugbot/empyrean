#include <fstream>
#include <prinrval.h>
#include "Profiler.h"
#include "NSPRUtility.h"

namespace pyr {

    static const size_t REMEMBERED_FRAMES = 60;

    
    // class ProfileBlock

    ProfileBlock::ProfileBlock(const std::string& name) {
        _name = name;
        lastFrames.resize(REMEMBERED_FRAMES);
    }

    void ProfileBlock::nextFrame() {
        for (int i = REMEMBERED_FRAMES - 1; i > 0; --i) {
            lastFrames[i] = lastFrames[i - 1];
        }
        lastFrames[0] = ProfileData();
    }

    float ProfileBlock::getAverageTime() const {
        float total = 0;
        for (size_t i = 0; i < REMEMBERED_FRAMES; ++i) {
            total += lastFrames[i].time();
        }
        return total / REMEMBERED_FRAMES;
    }

    float ProfileBlock::getAverageTotalTime() const {
        float total = 0;
        for (size_t i = 0; i < REMEMBERED_FRAMES; ++i) {
            total += lastFrames[i].timePlusChildren;
        }
        return total / REMEMBERED_FRAMES;
    }


    // class Profiler

    PYR_DEFINE_SINGLETON(Profiler)

    void Profiler::beginBlock(const std::string& name) {
        ProfilerState& ps = *_state;

        ProfileBlockPtr block = ps.blocks[name];
        if (!block) {
            block = new ProfileBlock(name);
            ps.blocks[name] = block;
            block->current = false;
        }

        PYR_ASSERT(!block->current, "Block can't be profiled recursively.");

        block->current   = true;
        block->entryTime = getNow();
        pushBlock(block);
    }

    void Profiler::endBlock() {
        ProfilerState& ps = *_state;

        ProfileBlockPtr block = popBlock();
        PYR_ASSERT(block->current, "Can't end block that isn't started.");

        float dt = getNow() - block->entryTime;
        if (dt > 0) { // ignore timer wraparound
            
            // Only record total time for top-level profiling blocks.
            if (ps.callStack.empty()) {
                ps.totalTime += dt;
            }

            block->update(dt);

            // If call stack isn't empty, update parent with time in children.
            if (!ps.callStack.empty()) {
                ps.callStack.top()->block->updateParent(dt);
            }
        }
        block->current = false;
    }

    void Profiler::nextFrame() {
        ProfilerState& ps = *_state;

        // For now, require that nextFrame() has to be called outside of profiling blocks.
        PYR_ASSERT(ps.callStack.empty(), "nextFrame() must be called from outside of profiling blocks.");
        ps.lastCallTree = ps.callTree;
        ps.callTree.clear();

        for (ProfileBlockMap::iterator i = ps.blocks.begin(); i != ps.blocks.end(); ++i) {
            i->second->nextFrame();
        }
    }

    void Profiler::pushBlock(ProfileBlockPtr block) {
        ProfilerState& ps = *_state;

        CallNodePtr cn;
        
        if (!ps.callStack.empty()) {
            CallNodeList& children = ps.callStack.top()->children;
            for (size_t i = 0; i < children.size(); ++i) {
                if (children[i]->block == block) {
                    cn = children[i];
                    break;
                }
            }
        }

        if (!cn) {
            cn = new CallNode(block);

            if (ps.callStack.empty()) {
                ps.callTree.push_back(cn);
            } else {
                ps.callStack.top()->children.push_back(cn);
            }
        }

        ps.callStack.push(cn);
    }

    ProfileBlockPtr Profiler::popBlock() {
        ProfilerState& ps = *_state;

        PYR_ASSERT(!ps.callStack.empty(), "popBlock() called when call stack is empty.");

        ProfileBlockPtr top = ps.callStack.top()->block;
        ps.callStack.pop();
        return top;
    }
};
