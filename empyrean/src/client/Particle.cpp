#include "Particle.h"

namespace pyr {

    Particle::Particle() {
        _lifeLeft = 10;
    }

    Particle::Particle(float lifeTime, Vec3f pos, Vec3f vel) {
        _position = pos;
        _velocity = vel;
        _oldPosition = pos;
        _oldVelocity = vel;
        _lifeLeft = lifeTime;
    }

    /// @todo Stolen from CollisionBox.  Put it somewhere global.
    float intersectLine(Vec2f& point, const Segment& seg1, const Segment& seg2) {
        float x1 = (seg1.v2[0] - seg1.v1[0]);
        float x2 = (seg2.v2[0] - seg2.v1[0]);
        float y1 = (seg1.v2[1] - seg1.v1[1]);
        float y2 = (seg2.v2[1] - seg2.v1[1]);

        float den = x2*y1 - x1*y2;
        if (den == 0) {
            // Parallel lines - no intersection
            point = Vec2f(0,0);
            return -1.0f;
        }
        float t = ((seg2.v1[1] - seg1.v1[1])*x2 + (seg1.v1[0] - seg2.v1[0])*y2)/den;
        float r;
        if(x2 != 0) {
             r = ((seg1.v1[0] - seg2.v1[0]) + t * x1)/x2;
        }
        else {
            float y = seg1.v1[1] * (1 - t) + seg1.v2[1] * t;
            if(y >= std::min(seg2.v1[1], seg2.v2[1]) && y <= std::max(seg2.v1[1], seg2.v2[1])) {
                r = 0.5f;
            }
            else {
                r = -1.0f;
            }

        }

        if( t < 0.005 || t > 1 || r < 0.005 || r > 1) {
            point = Vec2f(0,0);
            return -1.0f;
        } else {
            point[0] = seg1.v1[0] * (1 - t) + seg1.v2[0] * t;
            point[1] = seg1.v1[1] * (1 - t) + seg1.v2[1] * t;
            return t;
        }

    }

    Vec2f perp(const Vec2f& v) {
        return Vec2f(v[1], -v[0]);
    }

    void Particle::update(float dt, const Vec3f& accel, const std::vector<Segment>& segs) {
        // Reduce the time to live, and if dead or not updating positions automatically return
        _lifeLeft -= dt;
        if (!isAlive()) {
            return;
        }

        // Update the position
        _oldPosition = _position;
        _position += _velocity * dt;

        // Update the velocity
        _oldVelocity = _velocity;
        _velocity += accel * dt;

        Vec2f entPos(31, 3); /// @todo HACK FOR DEMO
        Vec2f oldPos(_oldPosition[0], _oldPosition[1]);
        Vec2f newPos(_position[0],    _position[1]);
        Segment pline(oldPos + entPos, newPos + entPos);

        for (size_t i = 0; i < segs.size(); ++i) {
            const Segment& s = segs[i];
            // need the normal of this segment.
            Vec2f n = perp(s.v2 - s.v1);
            if (dot(n, Vec2f(_oldVelocity[0], _oldVelocity[1])) > 0) {
                n = -n;
            }
            normalize(n);

            Vec2f p;
            float t = intersectLine(p, pline, s);
            if (t >= 0 && t <= 1) {
                Vec2f I = pline.v2 - pline.v1;
                Vec2f R = I - 2 * dot(n, I) * n;
                Vec2f p = pline.v1 + I * t + R * (1 - t);
                Vec2f v = normal(R) * length(_velocity) * 0.5f;
                p -= entPos;

                _position[0] = p[0];
                _position[1] = p[1];
                _velocity[0] = v[0];
                _velocity[1] = v[1];
                _oldPosition = _position;
                _oldVelocity = _velocity;
                break;
            }
        }
    }

}
