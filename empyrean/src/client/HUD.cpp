#include "HUD.h"
#include "GameEntity.h"
#include "OpenGL.h"
#include "GLUtility.h"
#include "Texture.h"

namespace pyr {
    PYR_DEFINE_SINGLETON(HUD)

        HUD::HUD() {
            // Initialize HUD values
            _barRadius = 20.0f;
            _barLongStraight = 50.0f;
            _barShortStraight = 5.0f;
            _barHeight = 5.0f;
            _numSegsInCurves = 30;
            _barBufferX = 10;
            _barBufferY = 10;
            _barBuffer = 3;
            _barPathLength = _barShortStraight+3.14159*_barRadius+_barLongStraight;
 
            calcBar();
            PYR_ASSERT(_vertsRight.size() == _vertsLeft.size(),
                       "Improper construction of HUD bar!");

            // Load the character thumbnail
            _thumbWidth = _ethCenter[0]-_vitCenter[0]-2*(_barShortStraight+3);
            _thumbHeight = _ethCenter[1]-_vitCenter[1]+2*(_barRadius-_barHeight/2.0f-3);
            _thumbnail = Texture::create("images/MikeThumbnail.jpg");
        }
        
    void HUD::draw(gltext::FontRendererPtr rend, Entity* ent) {
        PYR_ASSERT(ent!=0,"Null entity passed to HUD!");

        int vitality, ether, maxVitality, maxEther;
        GameEntity* gent = dynamic_cast<GameEntity*>(ent);
        gent->getVitalityUpdate(vitality,maxVitality);
        gent->getEtherUpdate(ether,maxEther);
        PYR_ASSERT(maxVitality>0,"Invalid maximum vitality!");
        PYR_ASSERT(maxEther>0,"Invalid maximum ether!");

        setOrthoProjection(400.0f, 300.0f);
        
        glDisable(GL_TEXTURE_2D);
        glPushMatrix();

        // Draw the vitality bar
        drawVitalityBar((float)vitality / (float)maxVitality);
     
        // Show the vitality number
        glPushMatrix();
        glTranslatef(_vitCenter[0]-8,_vitCenter[1]-10,0);
        glScalef(0.4,0.4,0.4);
        GLTEXT_STREAM(rend) << "VIT";
        glScalef(1.5,1.5,1.5);
        glTranslatef(-6,15,0);
        if (vitality < 100) {
            GLTEXT_STREAM(rend) << " " << vitality;
        }
        else {
            GLTEXT_STREAM(rend) << vitality;
        }
        glPopMatrix();

        // Draw the ether bar
        glPushMatrix();
        glTranslatef(_ethCenter[0],_ethCenter[1],0);
        glRotatef(180,0,0,1);
        glTranslatef(-_vitCenter[0],-_vitCenter[1],0);
        drawEtherBar((float)ether / (float)maxEther);
        glPopMatrix();

        // Show the ether number
        glPushMatrix();
        glTranslatef(_ethCenter[0]-4,_ethCenter[1]-10,0);
        glScalef(0.4,0.4,0.4);
        GLTEXT_STREAM(rend) << "ETH";
        glScalef(1.5,1.5,1.5);
        glTranslatef(-5,15,0);
        if (ether < 100) {
            GLTEXT_STREAM(rend) << " " << ether;
        }
        else {
            GLTEXT_STREAM(rend) << ether;
        }
        glPopMatrix();
        
        glEnable(GL_TEXTURE_2D);

        // Draw the character thumbnail
        glPushMatrix();
        glTranslatef(_vitCenter[0]+3+_barShortStraight,
                     _vitCenter[1]+3-(_barRadius-_barHeight/2.0f), 0);
        _thumbnail->bind();
        glBegin(GL_TRIANGLE_FAN);
        glTexCoord2f(0,0); glVertex2f(0,0);
        glTexCoord2f(0,1); glVertex2f(0,_thumbHeight);
        glTexCoord2f(1,1); glVertex2f(_thumbWidth,_thumbHeight);
        glTexCoord2f(1,0); glVertex2f(_thumbWidth,0);
        glEnd();
        glPopMatrix();

        glPopMatrix();
    }

    void HUD::drawVitalityBar(float vitPerc) {
        //Pick the color
        glColor4f(1.0-vitPerc*0.4,0.0,0.0,1.0);
        drawBar(vitPerc);
    }
    
    void HUD::drawEtherBar(float ethPerc) {
        //Pick the color
        glColor4f(0.0,0.65-ethPerc*0.2,0.75-ethPerc*0.2,1.0);
        drawBar(ethPerc);
    }

    void HUD::drawBar(float perc) {
        glBegin(GL_TRIANGLE_STRIP);

        // Values needed in bar construction
        int vertsToDraw = 1;
        float barLen = 0;

        // Check to see if the value is down to inside the small straight
        if (perc <= _barShortStraight/_barPathLength) {
            barLen = perc/(_barShortStraight/_barPathLength);
            glVertex2f(_vertsRight[0][0],_vertsRight[0][1]);
            glVertex2f(_vertsLeft[0][0],_vertsLeft[0][1]);
            glVertex2f(_vertsRight[0][0] - barLen*(_vertsRight[0][0]-_vertsRight[1][0]),
                       _vertsRight[1][1]);
            glVertex2f(_vertsLeft[0][0] - barLen*(_vertsLeft[0][0]-_vertsLeft[1][0]),
                       _vertsLeft[1][1]);
        }
        else {
            // Check to see if the value is inside the curved part
            if (perc <= (_barShortStraight+3.14159*_barRadius)/_barPathLength) {
                barLen = (perc-_barShortStraight/_barPathLength)/
                         (3.14159*_barRadius/_barPathLength);
                vertsToDraw += (int)(barLen*_numSegsInCurves);
            }
            // The value is in the long straight
            else {
                vertsToDraw = _vertsRight.size()-2;
            }
            
            // Draw the curve
            for (int i=0; i<vertsToDraw; i++) {
                glVertex2f(_vertsRight[i][0],_vertsRight[i][1]);
                glVertex2f(_vertsLeft[i][0],_vertsLeft[i][1]);
                glVertex2f(_vertsRight[i+1][0],_vertsRight[i+1][1]);
                glVertex2f(_vertsLeft[i+1][0],_vertsLeft[i+1][1]);
            }

            // Now draw the portion of the long straight if needs be.
            if (perc > (_barShortStraight+3.14159*_barRadius)/_barPathLength) {
                barLen = (perc-(_barShortStraight+3.14159*_barRadius)/_barPathLength)/
                         (_barLongStraight/_barPathLength);
                glVertex2f(_vertsRight[vertsToDraw][0],_vertsRight[vertsToDraw][1]);
                glVertex2f(_vertsLeft[vertsToDraw][0],_vertsLeft[vertsToDraw][1]);
                glVertex2f(_vertsRight[vertsToDraw][0] + barLen*(_vertsRight[vertsToDraw+1][0]-_vertsRight[vertsToDraw][0]),
                        _vertsRight[vertsToDraw+1][1]);
                glVertex2f(_vertsLeft[vertsToDraw][0] + barLen*(_vertsLeft[vertsToDraw+1][0]-_vertsLeft[vertsToDraw][0]),
                        _vertsLeft[vertsToDraw+1][1]);
            }
        }

        // Draw the missing part of the bar in black
        if (perc < 1) {
            glColor4f(0.0,0.0,0.0,1.0);
            if (perc <= _barShortStraight/_barPathLength) {
                glVertex2f(_vertsRight[0][0] - barLen*(_vertsRight[0][0]-_vertsRight[1][0]),
                            _vertsRight[1][1]);
                glVertex2f(_vertsLeft[0][0] - barLen*(_vertsLeft[0][0]-_vertsLeft[1][0]),
                            _vertsLeft[1][1]);
                glVertex2f(_vertsRight[1][0],_vertsRight[1][1]);
                glVertex2f(_vertsLeft[1][0],_vertsLeft[1][1]);
            }
            if (perc > (_barShortStraight+3.14159*_barRadius)/_barPathLength) {
                    glVertex2f(_vertsRight[vertsToDraw][0] + barLen*(_vertsRight[vertsToDraw+1][0]-_vertsRight[vertsToDraw][0]),
                            _vertsRight[vertsToDraw+1][1]);
                    glVertex2f(_vertsLeft[vertsToDraw][0] + barLen*(_vertsLeft[vertsToDraw+1][0]-_vertsLeft[vertsToDraw][0]),
                            _vertsLeft[vertsToDraw+1][1]);
                    glVertex2f(_vertsRight[vertsToDraw+1][0],_vertsRight[vertsToDraw+1][1]);
                    glVertex2f(_vertsLeft[vertsToDraw+1][0],_vertsLeft[vertsToDraw+1][1]);
            }
            else {
                for (int i=vertsToDraw; i<_vertsRight.size()-1; i++) {
                    glVertex2f(_vertsRight[i][0],_vertsRight[i][1]);
                    glVertex2f(_vertsLeft[i][0],_vertsLeft[i][1]);
                    glVertex2f(_vertsRight[i+1][0],_vertsRight[i+1][1]);
                    glVertex2f(_vertsLeft[i+1][0],_vertsLeft[i+1][1]);
                }
            }
        }

        glEnd();

        // Draw the outline
        glColor4f(1.0,1.0,1.0,1.0);
        glLineWidth(0.5);
        glBegin(GL_LINE_LOOP);
        for (int i=0; i<_vertsRight.size(); ++i) {
            glVertex2f(_vertsRight[i][0],_vertsRight[i][1]);
        }
        for (int i=_vertsLeft.size()-1; i>-1; --i) {
            glVertex2f(_vertsLeft[i][0],_vertsLeft[i][1]);
        }
        glEnd();
        glLineWidth(1.0);
    }

    void HUD::calcBar() {
        int centerX = _barBufferX + _barRadius + _barHeight/2.0f;
        int centerY = _barBufferY + _barRadius + _barHeight/2.0f;
        _vitCenter.set(centerX,centerY);
        _ethCenter.set(_vitCenter[0]+_barLongStraight,_vitCenter[1]+_barHeight+_barBuffer);

        // RIGHT SIDE
        // Calc the small straight
        _vertsRight.push_back( Vec2f(centerX + _barShortStraight, centerY + _barRadius - _barHeight/2.0f) );
        _vertsRight.push_back( Vec2f(centerX , centerY + _barRadius - _barHeight/2.0f) );
       
        // Calc the right arc
        float angle = -1.57080;  //-PI/2
        for (int i=0; i<_numSegsInCurves; ++i, angle += 3.14159/(float)_numSegsInCurves) {
            _vertsRight.push_back( Vec2f(centerX - (_barRadius - _barHeight/2.0f)*cos(angle), 
                                            centerY - (_barRadius - _barHeight/2.0f)*sin(angle)) );
        }
 
        // Calc the straight portion 
        _vertsRight.push_back(Vec2f(centerX + _barLongStraight, _barHeight + _barBufferY));
        
        // LEFT SIDE
        // Calc the small straight
        _vertsLeft.push_back( Vec2f(centerX + _barShortStraight, centerY + _barRadius + _barHeight/2.0f) );
        _vertsLeft.push_back( Vec2f(centerX, centerY + _barRadius + _barHeight/2.0f) );
        
        // Draw the left arc
        angle = -1.57080;
        for (int i=0; i<_numSegsInCurves; ++i, angle += 3.14159/(float)_numSegsInCurves) {
            _vertsLeft.push_back( Vec2f(centerX - (_barRadius + _barHeight/2.0f)*cos(angle), 
                                           centerY - (_barRadius + _barHeight/2.0f)*sin(angle)) );
        }

        // Calc the straight portion 
        _vertsLeft.push_back(Vec2f(centerX + _barLongStraight, _barBufferY));
     }
};