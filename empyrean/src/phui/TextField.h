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
 * File:          $RCSfile: TextField.h,v $
 * Date modified: $Date: 2004-06-05 02:23:23 $
 * Version:       $Revision: 1.8 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#ifndef PHUI_TEXT_FIELD_H
#define PHUI_TEXT_FIELD_H

#include <string>
#include "Widget.h"

namespace phui
{
    /**
     * A classic UI textfield widget.
     */
    class TextField : public Widget
    {
    public:
        /**
         * Creates a new button with the given text at (0,0) with size (0,0).
         *
         * @param text      the text for the button
         */
        TextField(const std::string& text = "");

        void draw() const;

        void setText(const std::string& text);
        const std::string& getText() const;

        void onKeyDown(InputKey key, InputModifiers modifiers);

    private:
        std::string mText;

        /// Actual cursor position horizontally
        size_t mCursorScreenPosition;

        /// Index of character of where cursor is at
        size_t mCursorCharacterPosition;
    };

    typedef pyr::RefPtr<TextField> TextFieldPtr;
}

#endif
