#include <fstream>
#include <prinrval.h>
#include "Profiler.h"
#include "NSPRUtility.h"

namespace pyr {

    PYR_DEFINE_SINGLETON(Profiler)
    
    Profiler::Profiler() {
    }

    Profiler::~Profiler() {
        for (BlockMap::iterator i = _blocks.begin(); i != _blocks.end(); ++i) {
            delete i->second;
        }
        _blocks.clear();
    }

    void Profiler::beginBlock(const std::string& name) {
        ProfileBlock* block = _blocks[name];
        if (!block) {
            block = new ProfileBlock;
            _blocks[name] = block;
        }

        PYR_ASSERT(!block->current, "Block can't be profiled recursively.");

        block->current   = true;
        block->entryTime = getNow();
        _callStack.push(block);
    }

    void Profiler::endBlock() {
        PYR_ASSERT(!_callStack.empty(), "endBlock() called when call stack is empty.");

        ProfileBlock* block = _callStack.top();
        _callStack.pop();
        PYR_ASSERT(block->current, "Can't end block that isn't started.");

        float dt = getNow() - block->entryTime;
        if (dt > 0) { // ignore timer wraparound
            _totalTime += dt;
            block->update(dt);
            
            // If call stack isn't empty, update parent with time in children.
            if (!_callStack.empty()) {
                _callStack.top()->updateParent(dt);
            }
        }
        block->current = false;
    }
    
    void Profiler::nextFrame() {
        for (BlockMap::iterator i = _blocks.begin(); i != _blocks.end(); ++i) {
            i->second->nextFrame();
        }
    }
};
