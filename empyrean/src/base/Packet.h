#ifndef PYR_PACKET_H
#define PYR_PACKET_H


#include "BufferParser.h"
#include "ByteBuffer.h"
#include "Types.h"


namespace pyr {

    #define PYR_PACKET_ID(id) \
        enum { ID = id };     \
        u16 getID() const {   \
            return ID;        \
        }

    class Packet {
    public:
        Packet() {
            _id = 0;
            _size = 0;
        }
        
        virtual ~Packet() { }
        
        u16 getID()   const { return _id;   }
        u16 getSize() const { return _size; }

        virtual void serialize(ByteBuffer& out) const = 0;
        
    protected:
        void setID(u16 id)     { _id   = id;   }
        void setSize(u16 size) { _size = size; }
        
    private:
        u16 _id;
        u16 _size;
    };
    
    
    // For an explanation of the magic below, see
    // http://aegisknight.org/struct.txt
    
    
    #define PYR_CTOR_ARGS_string(size, name)    const std::string& name,
    #define PYR_CTOR_INIT_string(size, name)    m_ ## name = name;
    #define PYR_SIZE_string(size, name)         size +
    #define PYR_ACCESS_string(size, name)       const std::string& name() const { return m_ ## name; }
    #define PYR_SERIALIZE_string(size, name)    out.add_string(name(), size);
    #define PYR_PARSE_string(size, name)        std::string name; bp.read(name, size);
    #define PYR_CREATE_string(size, name)       name,
    #define PYR_CONTENTS_string(size, name)     std::string m_ ## name;
    
    #define PYR_CTOR_ARGS_field(type, name)     const type& name,
    #define PYR_CTOR_INIT_field(type, name)     m_ ## name = name;
    #define PYR_SIZE_field(type, name)          sizeof(type) +
    #define PYR_ACCESS_field(type, name)        const type& name() const { return m_ ## name; }
    #define PYR_SERIALIZE_field(type, name)     out.add(name());
    #define PYR_PARSE_field(type, name)         type name; bp.read(name);
    #define PYR_CREATE_field(type, name)        name,
    #define PYR_CONTENTS_field(type, name)      type m_ ## name;
    

    #define PYR_CTOR_ARGS(_) PYR_CTOR_ARGS_ ## _
    #define PYR_CTOR_INIT(_) PYR_CTOR_INIT_ ## _
    #define PYR_SIZE(_)      PYR_SIZE_      ## _
    #define PYR_ACCESS(_)    PYR_ACCESS_    ## _
    #define PYR_SERIALIZE(_) PYR_SERIALIZE_ ## _
    #define PYR_PARSE(_)     PYR_PARSE_     ## _
    #define PYR_CREATE(_)    PYR_CREATE_    ## _
    #define PYR_CONTENTS(_)  PYR_CONTENTS_  ## _
    
        
    #define PYR_DECLARE_PACKET(name, id, body)                          \
        class name : public Packet {                                    \
        public:                                                         \
            struct EndOfList {};                                        \
                                                                        \
            enum { ID = id };                                           \
                                                                        \
            name(body(PYR_CTOR_ARGS)  EndOfList = EndOfList());         \
                                                                        \
            body(PYR_ACCESS)                                            \
                                                                        \
            void serialize(ByteBuffer& out) const;                      \
            static Packet* create(int size, const void* bytes);         \
                                                                        \
        private:                                                        \
            body(PYR_CONTENTS)                                          \
        };
        
    
    #define PYR_DEFINE_PACKET(name, id, body)                           \
        name::name(body(PYR_CTOR_ARGS) EndOfList) {                     \
            body(PYR_CTOR_INIT)                                         \
            setID(id);                                                  \
            setSize(body(PYR_SIZE)  0);                                 \
        }                                                               \
                                                                        \
        void name::serialize(ByteBuffer& out) const {                   \
            body(PYR_SERIALIZE)                                         \
        }                                                               \
                                                                        \
        Packet* name::create(int size, const void* bytes) {             \
            BufferParser bp(size, bytes);                               \
            body(PYR_PARSE)                                             \
            if (bp.passedEnd()) {                                       \
                return 0;                                               \
            } else {                                                    \
                return new name(body(PYR_CREATE)  EndOfList());         \
            }                                                           \
        }

}


#endif
