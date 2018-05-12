// fragment shader, thickness pass
#version 410 core

uniform float u_PointRadius;

flat in int f_InShadow;

out float outThick;
//------------------------------------------------------------------------------------------
void main(void)
{
    if(f_InShadow > 0) {
        discard;
    }

    // calculate normal from texture coordinates
    vec2 N = gl_PointCoord.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);

    float mag = dot(N, N);
    if(mag > 1.0) {
        discard;              // kill pixels outside circle
    }
    outThick = 2.0 * u_PointRadius * sqrt(1.0 - mag) / 8.0f;
}
