/* -*- Mode: C++; tab-width: 3; indent-tabs-mode: nil c-basic-offset: 3 -*- */
// vim:cindent:ts=3:sw=3:et:tw=80:sta:
/***************************************************************** phui-cpr beg
 *
 * phui - flexible user interface subsystem
 * phui is (C) Copyright 2002 by
 *      Chad Austin, Josh Carlson, Johnathan Gurley,
 *      Ben Scott, Levi Van Oort
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 *
 * -----------------------------------------------------------------
 * File:          $RCSfile: RefPtr.h,v $
 * Date modified: $Date: 2003-09-22 23:45:02 $
 * Version:       $Revision: 1.3 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#ifndef PHUI_REF_PTR_H
#define PHUI_REF_PTR_H


#include "Debug.h"


namespace phui
{
   /**
    * A smart/safe pointer that automagically handles reference counting on objects
    * that derive from RefCounted. This is essentially a drop in replacement for
    * your standard C++ pointer type.
    *
    * @param VALUE_TYPE    the type of object this pointer points to
    */
   template< class VALUE_TYPE >
   class RefPtr
   {
   public:
      /// The type of object we are pointing to.
      typedef VALUE_TYPE ValueType;

   public:
      /**
       * Creates a ref pointer pointing to the given object. Defaults to
       * pointing to NULL if no object is given.
       *
       * @param ptr     the object to point to
       */
      RefPtr(ValueType* ptr = 0)
         : mPtr(ptr)
      {
         if (mPtr)
         {
            mPtr->ref();
         }
      }

      /**
       * Creates a copy of the given ref pointer.
       *
       * @param ptr     the RefPtr to copy
       */
      RefPtr(const RefPtr<ValueType>& ptr)
         : mPtr(ptr.mPtr)
      {
         if (mPtr)
         {
            mPtr->ref();
         }
      }
      
      /**
       * This templated constructor allows you to do automatic conversions
       * to smart pointers of base classes.
       */
      template<typename T>
      RefPtr(const RefPtr<T>& ptr)
         : mPtr(ptr.get())
      {
         if (mPtr)
         {
            mPtr->ref();
         }
      }

      /**
       * Destructor that releases its reference to the object it points to.
       */
      ~RefPtr()
      {
         if (mPtr)
         {
            mPtr->unref();
         }
      }

      /**
       * Points this pointer to a new object (possibly NULL). This will release
       * the reference to the current object and increment the reference to the
       * new object.
       *
       * @param ptr     the new object this pointer should point to.
       */
      RefPtr<ValueType>& operator=(ValueType* ptr)
      {
         if (mPtr)
         {
            mPtr->unref();
         }
         mPtr = ptr;
         if (mPtr)
         {
            mPtr->ref();
         }
         return *this;
      }

      /**
       * Points this pointer to a new ref pointer (possibly NULL). This will
       * release the reference to the current object and increment the reference
       * to the new object.
       *
       * @param ptr     the new object this pointer should point to.
       */
      RefPtr<ValueType>& operator=(const RefPtr<ValueType>& ptr)
      {
         return *this = ptr.mPtr;
      }

      /**
       * Dereferencing the ref pointer is equivalent to dereferencing the normal
       * pointer of the object we have stored.
       */
      ValueType& operator*() const
      {
         PYR_ASSERT(mPtr, "Dereferencing a NULL ref pointer");
         return *mPtr;
      }

      /**
       * The member access operator is overloaded to act in a transparent manner
       * to allow access to the members of the real object.
       */
      ValueType* operator->() const
      {
         PYR_ASSERT(mPtr, "Accessing member of a NULL ref pointer");
         return mPtr;
      }

      /**
       * Gets a pointer to the object being pointed to by this ref pointer.
       */
      ValueType* get() const
      {
         return mPtr;
      }

      /**
       * Allow the ref pointer to be used in boolean tests for NULL.
       */
      operator bool() const
      {
         return mPtr != 0;
      }

   private:
      /// The object being pointed to by this ref pointer.
      ValueType *mPtr;
   };


   ///@{
   /**
    * Allow this ref pointer to be compared to other ref pointers. A comparison
    * on the contained (actual) pointers is made. This is templated to support
    * comparisons between ref pointers to derived types.
    *
    * @return  true if a and b point to the same object
    */
   template< class T, class U >
   bool operator==(const RefPtr<T>& a, const RefPtr<U>& b)
   {
      return (a.get() == b.get());
   }

   template< class T >
   bool operator==(const RefPtr<T>& a, const T* b)
   {
      return (a.get() == b);
   }

   template< class T >
   bool operator==(const T* a, const RefPtr<T>& b)
   {
      return (a == b.get());
   }
   ///@}

   ///@{
   /**
    * Allow this ref pointer to be compared to other ref pointers. A comparison
    * on the contained (actual) pointers is made. This is templated to support
    * comparisons between ref pointers to derived types.
    *
    * @return  true if a and b point do not point to the same object
    */
   template< class T, class U >
   bool operator!=(const RefPtr<T>& a, const RefPtr<U>& b)
   {
      return (a.get() != b.get());
   }

   template< class T >
   bool operator!=(const RefPtr<T>& a, const T* b)
   {
      return (a.get() != b);
   }

   template< class T >
   bool operator!=(const T* a, const RefPtr<T>& b)
   {
      return (a != b.get());
   }
   ///@}
}

#endif
