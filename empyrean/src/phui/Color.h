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
 * File:          $RCSfile: Color.h,v $
 * Date modified: $Date: 2004-06-05 02:23:23 $
 * Version:       $Revision: 1.3 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#ifndef PHUI_COLOR_H
#define PHUI_COLOR_H


#include "OpenGL.h"


namespace phui {
   
    /**
     * Color tuple for easier color handling.
     */
    struct Color {
        /**
         * Creates a new color initialized to transparent black.
         */
        Color() {
            r = 0;
            g = 0;
            b = 0;
            a = 0;
        }

        /**
         * Creates a color with the given color values.
         *
         * @param r_   the red part of the color
         * @param g_   the green part of the color
         * @param b_   the blue part of the color
         * @param a_   the alpha/transparent part of the color
         */
        Color(float r_, float g_, float b_, float a_ = 1.0f) {
            r = r_;
            g = g_;
            b = b_;
            a = a_;
        }

        /**
         * Changes this color to the new color values.
         *
         * @param r_   the red part of the color
         * @param g_   the green part of the color
         * @param b_   the blue part of the color
         * @param a_   the alpha/transparent part of the color
         */
        void set(float r_, float g_, float b_, float a_) {
            r = r_;
            g = g_;
            b = b_;
            a = a_;
        }

        float r;  /**< The red part of the color. */
        float g;  /**< The green part of the color. */
        float b;  /**< The blue part of the color. */
        float a;  /**< The alpha/transparent part of the color. */
   };

   inline std::ostream& operator<<(std::ostream& out, const Color& clr) {
      return out << clr.r << ", " << clr.g << ", " << clr.b << ", " << clr.a;
   }

   inline bool operator==(const Color& lhs, const Color& rhs) {
      return lhs.r == rhs.r && lhs.g == rhs.g && lhs.b == rhs.b && lhs.a == rhs.a;
   }

   inline bool operator!=(const Color& lhs, const Color& rhs) {
      return !(lhs == rhs);
   }

   /**
    * OpenGL helper function to set our color struct as the current GL color.
    *
    * @param clr     the color to set as the current color
    */
   inline void glColor(const Color& clr)
   {
      glColor4f(clr.r, clr.g, clr.b, clr.a);
   }

   static const Color NONE (0, 0, 0, 0);
   static const Color WHITE(1, 1, 1, 1);
   static const Color BLACK(0, 0, 0, 1);

   static const Color RED    (1, 0,    0, 1);
   static const Color ORANGE (1, 0.5,  0, 1);
   static const Color YELLOW (1, 1,    0, 1);
   static const Color GREEN  (0, 1,    0, 1);
   static const Color BLUE   (0, 0,    1, 1);
   static const Color PURPLE (1, 0,    1, 1);
}

#endif
