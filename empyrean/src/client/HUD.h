#ifndef PYR_HUD_H
#define PYR_HUD_H

#include "Singleton.h"
#include <gltext.h>
#include "VecMath.h"

namespace pyr {
    class Entity;
    class Texture;

    class HUD {
        PYR_DECLARE_SINGLETON(HUD)

        HUD();
        ~HUD(){}

        void drawVitalityBar(float vitPerc);
        void drawEtherBar(float ethPerc);
        void calcBar();
        void drawBar(float perc);

    public:
        void draw(gltext::FontRendererPtr rend, Entity* ent); 

    private:
        std::vector<Vec2f> _vertsLeft;
        std::vector<Vec2f> _vertsRight;
        Vec2f _vitCenter;
        Vec2f _ethCenter;
        Texture* _thumbnail;
        float _thumbWidth;
        float _thumbHeight;
        float _barRadius;
        float _barLongStraight;
        float _barShortStraight;
        float _barHeight;
        int _numSegsInCurves;
        int _barBufferX;
        int _barBufferY;
        int _barBuffer;
        float _barPathLength;
    };
};
#endif
