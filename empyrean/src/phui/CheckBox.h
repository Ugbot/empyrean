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
 * File:          $RCSfile: CheckBox.h,v $
 * Date modified: $Date: 2004-11-09 06:18:18 $
 * Version:       $Revision: 1.5 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#ifndef PHUI_CHECK_BOX_H
#define PHUI_CHECK_BOX_H

#include <string>
#include "Widget.h"

namespace phui
{
   class CheckBox : public Widget
   {
   public:
      CheckBox(const std::string& text, bool checked = false);

      void draw() const;

      void check()   { setChecked(true);  }
      void uncheck() { setChecked(false); }

      void setChecked(bool checked);
      bool isChecked() const;
      
      void setText(const std::string& text);
      const std::string& getText() const;

      void onMouseDown(InputButton button, const Point& p);

   private:
      bool mIsChecked;
      std::string mText;
   };
   PYR_REF_PTR(CheckBox);
}

#endif
