#ifndef PYR_LOG_EVENT_H
#define PYR_LOG_EVENT_H


#include <string>
#include "wx.h"


namespace pyr {

    BEGIN_DECLARE_EVENT_TYPES()
        DECLARE_EVENT_TYPE(EVT_LOG, wxEVT_USER_FIRST)
    END_DECLARE_EVENT_TYPES()

    class LogEvent : public wxEvent {
    public:
        LogEvent(const std::string& msg) {
            _message = msg;
            SetEventType(EVT_LOG);
        }
        
        LogEvent* Clone() const {
            return new LogEvent(_message);
        }
        
        const std::string& getMessage() const {
            return _message;
        }
        
    private:
        std::string _message;
    };

}


#endif
