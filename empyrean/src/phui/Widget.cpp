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
 * File:          $RCSfile: Widget.cpp,v $
 * Date modified: $Date: 2004-06-05 02:23:23 $
 * Version:       $Revision: 1.5 $
 * -----------------------------------------------------------------
 *
 ************************************************************** phui-cpr-end */
#include <stdio.h>
#include <stdexcept>
#include "NullLayout.h"
#include "Widget.h"


namespace phui {

    Widget::Widget(LayoutPtr layout)
        : mEnabled(true)
        , mVisible(true)
        , mBackgroundColor(BLACK)
        , mForegroundColor(WHITE)
    {
        gltext::FontPtr font = gltext::OpenFont("fonts/Vera.ttf", 18);
        if (!font) {
            throw std::runtime_error("phui: Font not found");
        }
        setFont(font);  // creates the renderer

        mParent = 0;

        setLayout(layout);
    }
    
    Widget::~Widget() {
        while (!mChildren.empty()) {
            remove(mChildren[0]);
        }
        setModal(0);
    }

    const Point& Widget::getPosition() const {
        return mPosition;
    }

    void Widget::setPosition(const Point& p) {
        mPosition = p;
    }

    void Widget::center() {
        if (mParent) {
            int x = (mParent->getWidth()  - getWidth())  / 2;
            int y = (mParent->getHeight() - getHeight()) / 2;
            setPosition(x, y);
        }
    }

    void Widget::centerOnScreen() {
        // Find highest parent.
        Widget* p = this;
        Point offset;
        while (p->mParent) {
            p = p->mParent;
            offset += p->getPosition();
        }

        Point pos((p->getWidth() - getWidth()) / 2,
                  (p->getHeight() - getHeight()) / 2);
        setPosition(pos - offset);
    }

    const Size& Widget::getSize() const {
        return mSize;
    }

    void Widget::setSize(const Size& size) {
        mSize = size;
        mLayout->layout(this);
    }

    const Insets& Widget::getInsets() const {
        return mInsets;
    }

    void Widget::setInsets(const Insets& insets) {
        mInsets = insets;
    }

    bool Widget::isEnabled() const {
        return mEnabled && !mModal;
    }

    void Widget::setEnabled(bool enabled) {
        mEnabled = enabled;
    }

    bool Widget::isVisible() const {
        return mVisible;
    }

    void Widget::setVisible(bool visible) {
        mVisible = visible;
    }

    void Widget::setBackgroundColor(const Color& clr) {
        mBackgroundColor = clr;
    }

    const Color& Widget::getBackgroundColor() const {
        return mBackgroundColor;
    }

    void Widget::setForegroundColor(const Color& clr) {
        mForegroundColor = clr;
    }

    const Color& Widget::getForegroundColor() const {
        return mForegroundColor;
    }

    void Widget::setFont(const gltext::FontPtr& font) {
        mFontRenderer = gltext::CreateRenderer(gltext::TEXTURE, font);
        if (!mFontRenderer) {
            throw std::runtime_error("phui: Font renderer creation failed");
        }
    }

    gltext::FontPtr Widget::getFont() const {
        return mFontRenderer->getFont();
    }

    const gltext::FontRendererPtr& Widget::getFontRenderer() const {
        return mFontRenderer;
    }

    void Widget::setLayout(LayoutPtr layout) {
        if (!layout) {
            layout = new NullLayout;
        }
        mLayout = layout;
        mLayout->layout(this);
    }

    LayoutPtr Widget::getLayout() const {
        return mLayout;
    }

    Widget* Widget::getParent() const {
        return mParent;
    }
    
    void Widget::add(WidgetPtr widget) {
        // First remove the widget from its old parent.
        if (widget->getParent()) {
            widget->getParent()->remove(widget);
        }

        // Now add the widget.
        mChildren.push_back(widget);
        widget->setParent(this);

        mLayout->layout(this);
    }

    void Widget::remove(WidgetPtr widget) {
        for (size_t i = 0; i < mChildren.size(); ++i) {
            if (mChildren[i] == widget) {
                mChildren.erase(mChildren.begin() + i);
                widget->setParent(0);

                mLayout->layout(this);
            }
        }
    }

    size_t Widget::getChildCount() const {
        return mChildren.size();
    }

    WidgetPtr Widget::getChild(size_t idx) const {
        // assert within bounds?
        return mChildren[idx];
    }

    void Widget::focus(WidgetPtr child) {
        // Find the index of the child.
        size_t idx;
        for (idx = 0; idx < getChildCount(); ++idx) {
            if (child == getChild(idx)) {
                break;
            }
        }

        // Move it to the end.
        while (idx + 1 < getChildCount()) {
            std::swap(mChildren[idx], mChildren[idx + 1]);
            ++idx;
        }
    }

    WidgetPtr Widget::getFocus() const {
        if (mModal) {
            return mModal;
        }

        if (mChildren.empty()) {
            return 0;
        } else {
            return mChildren[mChildren.size() - 1];
        }
    }

    bool Widget::contains(const Point& p) const {
        return (p.x >= 0 && p.x < mSize.getWidth() &&
                p.y >= 0 && p.y < mSize.getHeight());
    }

    Point Widget::getScreenPosition() const {
        Point p = getPosition();
        WidgetPtr parent = getParent();
        while (parent) {
            p += parent->getPosition();
            parent = parent->getParent();
        }
        return p;
    }

    bool Widget::hasFocus() const {
        const Widget* parent = getParent();
        const Widget* child = this;
        while (parent) {
            if (parent->getFocus() != child) {
                return false;
            }
            child = parent;
            parent = parent->getParent();
        }
        return true;
    }

    void Widget::setModal(WidgetPtr w, ModalListener* listener, bool centered) {
        if (mModal) {
            mModal->setParent(0);
        }
        mModal = w;
        mModalListener = listener;
        if (mModal) {
            mModal->setParent(this);
            if (centered) {
                mModal->centerOnScreen();
            }
        }
    }

    void Widget::endModal(int result) {
        if (Widget* parent = getParent()) {
            ModalListener* listener = parent->mModalListener;
            parent->setModal(0);
            if (listener) {
                listener->onEndModal(this, result);
            }
        }
    }

    WidgetPtr Widget::getModal() const {
        return mModal;
    }

    void Widget::setParent(Widget* parent) {
        mParent = parent;
    }

}
