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
 * File:          $RCSfile: Button.h,v $
 * Date modified: $Date: 2003-08-08 04:55:49 $
 * Version:       $Revision: 1.5 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#ifndef PHUI_BUTTON_H
#define PHUI_BUTTON_H

#include <string>
#include <iostream>
#include <list>
#include "Widget.h"
#include "ActionListener.h"

namespace phui
{

   class Button : public Widget
   {
   public:
      /**
       * Creates a new button with the given text at (0,0) with size (0,0).
       *
       * @param text      the text for the button
       */
      Button(const std::string& text = "");

      void draw();

      void setText(const std::string& text);
      const std::string& getText() const;

      /**
       * Called whenever a mouse button has been pressed inside this button. In
       * this case, we want to set the button's down state so that it can update
       * its visual appearance and test if the next MouseUp event will be inside
       * this button.
       */
      void onMouseDown(InputButton button, const Point& p);

      /**
       * Called whenever the mouse has moved inside this button. In this case,
       * we want to make the button only appear pressed while the mouse is inside
       * its rectangle (like a real windows button).
       */
      void onMouseMove(const Point& p);

      /**
       * Called whenever a mouse button has been released after it has been
       * pressed inside this button. If the button is released inside this
       * button then we will fire a ButtonPressed event, otherwise we'll just
       * toggle the button's down state.
       */
      void onMouseUp(InputButton button, const Point& p);


      /**
       * Adds the given action listener that wishes to receive for button events.
       */
      void addActionListener(ActionListenerPtr listener);
      
      template<typename T>
      void addMethodListener(T* object, void (T::*method)(const ActionEvent&))
      {
         typedef void (T::*Method)(const ActionEvent&);
      
         struct Listener : public ActionListener
         {
            Listener(T* object, Method method)
            {
               mObject = object;
               mMethod = method;
            }
         
            void onAction(const ActionEvent& evt)
            {
               (mObject->*mMethod)(evt);
            }
            
         private:
            T* mObject;
            Method mMethod;
         };
         
         addActionListener(new Listener(object, method));
      }

      /**
       * Removes the given action listener for this button.
       */
      void removeActionListener(ActionListenerPtr listener);

   private:
      /// Helper to fire action events to listeners.
      void fireActionEvent();

   private:
      std::string mText;

      /// Button down state. True if the button appears down.
      bool mButtonDown;

      /// Button press state. True if the button is being pressed.
      bool mButtonPressed;

      /**
       * All listeners for this button
       */
      typedef std::list<ActionListenerPtr> ListenerList;
      typedef ListenerList::iterator ListenerIter;
      ListenerList mListeners;
   };

   typedef RefPtr<Button> ButtonPtr;
}

#endif
