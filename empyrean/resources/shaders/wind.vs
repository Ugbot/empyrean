/*
ATI, you suck.
#version 110
*/

uniform vec4 waveApexes;
attribute float weight;
attribute float vx;

vec4 transform(vec4 pos) {
    return gl_ModelViewProjectionMatrix * pos;
}

float getOffset(float wa) {
    float apex = wa - vx;

    // 1 / (x^2 + 1) gives a nice Gaussian-ish distribution.
    float w = 1.0 / (apex * apex + 1.0);

    // Now add that to itself and recalculate in order to give the
    // distribution a steeper slope on the right.
    apex += w;
    w = 1.0 / (apex * apex * 0.1 + 1.0);

    // Calculate the wind factor.
    float off = sin(weight * weight * w);
    return off * 0.3;
}

void main() {
    float offset =
        getOffset(waveApexes.x) +
        getOffset(waveApexes.y) +
        getOffset(waveApexes.z) +
        getOffset(waveApexes.w);
  
    gl_Position = transform(gl_Vertex + vec4(offset, 0, 0, 0));
    gl_FrontColor = gl_Color;
}
