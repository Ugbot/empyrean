#include <boost/python.hpp>
#include <gmtl/gmtl.h>
#include "PythonGMTL.h"
using namespace boost::python;
using namespace gmtl;


namespace pyr {

    template<typename Indexable, typename Type>
    void setArrayElement(Indexable& obj, unsigned i, Type value) {
        obj[i] = value;
    }

    template<typename Indexable, typename Type>
    Type& getArrayElement(Indexable& obj, unsigned i) {
        return obj[i];
    }

    template<typename Type, unsigned Size>
    void bindVector(const char* name, const char* basename) {
        typedef Vec<Type, Size> MyVec;
        typedef VecBase<Type, Size> MyVecBase;

        { scope s =
            class_<MyVecBase>(basename)
                .def(init<>())
                .def(init<const MyVecBase&>())
                .def(init<Type, Type>())
                .def(init<Type, Type, Type>())
                .def(init<Type, Type, Type, Type>())
                .def("__getitem__", getArrayElement<MyVecBase, Type>, return_value_policy<copy_non_const_reference>())
                .def("__setitem__", setArrayElement<MyVecBase, Type>)
                .def(-self)
                .def(self += self)
                .def(self + self)
                .def(self -= self)
                .def(self - self)
                .def(self *= Type())
                .def(self * Type())
                .def(Type() * self)
                .def(self /= Type())
                .def(self / Type())
                .def(self == self)
                .def(self != self)
                .def(self_ns::str(self))
                ;
        }
        
        { scope s =
            class_<MyVec, bases<MyVecBase> >(name)
                .def(init<>())
                .def(init<const MyVecBase&>())
                .def(init<const MyVec&>())
                .def(init<Type, Type>())
                .def(init<Type, Type, Type>())
                .def(init<Type, Type, Type, Type>())
                ;
        }

        implicitly_convertible<MyVec, MyVecBase>();
        implicitly_convertible<MyVecBase, MyVec>();
    }

    void bindGMTL() {
        bindVector<float,  2>("Vec2f", "VecBase2f");
        bindVector<float,  3>("Vec3f", "VecBase3f");
        bindVector<float,  4>("Vec4f", "VecBase4f");
        bindVector<double, 2>("Vec2d", "VecBase2d");
        bindVector<double, 3>("Vec3d", "VecBase3d");
        bindVector<double, 4>("Vec4d", "VecBase4d");
        bindVector<int,    2>("Vec2i", "VecBase2i");
        bindVector<int,    3>("Vec3i", "VecBase3i");
        bindVector<int,    4>("Vec4i", "VecBase4i");
    }

}
