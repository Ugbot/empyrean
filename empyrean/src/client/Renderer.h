#ifndef PYR_RENDERER_H
#define PYR_RENDERER_H


#include <gltext.h>
#include "Color.h"
#include "GLUtility.h"
#include "Texture.h"


namespace pyr {

    class Projection {
    public:
        virtual void apply() const = 0;
    };

    
    class Transformation {
    public:
        /// Identity.
        Transformation() {
        }

        /// Translation.
        Transformation(const Vec2f& translation) {
            _translation = translation;
        }

        const Vec2f& getTranslation() const {
            return _translation;
        }

        void apply() {
            glTranslate(_translation);
        }

    private:
        Vec2f _translation;
    };


    class StateSet {
    public:
        StateSet() {
            // Does this reflect GL defaults?
            _color = Color(1, 1, 1, 1);
            _texture = 0;
            _blend = false;
        }

        void setColor(const Color& color) { _color = color; }
        const Color& getColor() const     { return _color;  }

        void setTexture(Texture* texture) { _texture = texture; }
        Texture* getTexture() const       { return _texture;    }

        void setBlend(bool blend) { _blend = blend; }
        bool getBlend() const     { return _blend;  }

        void apply() const {
            glColor(_color);

            if (_texture) {
                glEnable(GL_TEXTURE_2D);
                _texture->bind();
            } else {
                glDisable(GL_TEXTURE_2D);
            }

            if (_blend) {
                glEnable(GL_BLEND);
                glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
            } else {
                glDisable(GL_BLEND);
            }
        }

    private:
        Color _color;
        Texture* _texture;
        bool _blend;
    };


    class Drawable {
    public:
        // Should have a stateset as well.

        Drawable(const Transformation& xform, const StateSet& state) {
            _xform = xform;
            _state = state;
        }

        virtual ~Drawable() {
        }

        const Transformation& getTransformation() const {
            return _xform;
        }

        const StateSet& getStateSet() const {
            return _state;
        }

        virtual void draw() = 0;

    private:
        Transformation _xform;
        StateSet _state;
    };


    void beginPass(const Projection& projection);
    void endPass();
    void addDrawable(Drawable* drawable);


    class OrthoProjection : public Projection {
    public:
        OrthoProjection(int width, int height, bool cartesian = false) {
            _width     = static_cast<float>(width);
            _height    = static_cast<float>(height);
            _cartesian = cartesian;
        }
        
        OrthoProjection(float width, float height, bool cartesian = false) {
            _width     = width;
            _height    = height;
            _cartesian = cartesian;
        }

        void apply() const {
            setOrthoProjection(_width, _height, _cartesian);
        }

    private:
        float _width;
        float _height;
        bool _cartesian;
    };


    class TextDrawable : public Drawable {
    public:
        TextDrawable(gltext::FontRendererPtr renderer, const Vec2f& pos, const std::string& text)
            : Drawable(pos, buildStateSet())
        {
            _renderer = renderer;
            _text = text;
        }

        void draw() {
            _renderer->render(_text.c_str());
        }

    private:
        StateSet buildStateSet() {
            StateSet ss;
            ss.setBlend(true);
            return ss;
        }

        gltext::FontRendererPtr _renderer;
        std::string _text;
    };


    class TextStream : public std::ostringstream {
    public:
        TextStream(gltext::FontRendererPtr renderer, const Vec2f& pos) {
            _renderer = renderer;
            _pos = pos;
        }

        ~TextStream() {
            addDrawable(new TextDrawable(_renderer, _pos, str()));
        }

        TextStream& get() {
            return *this;
        }

    private:
        gltext::FontRendererPtr _renderer;
        Vec2f _pos;
    };


    #define PYR_TEXT_STREAM(renderer, pos) pyr::TextStream(renderer, pos).get()


    void drawTexture(const Vec2f& pos, Texture* texture, bool blend);
    void drawTexture(const Vec2f& pos, const Vec2f& size, Texture* texture, bool blend);

}


#endif
