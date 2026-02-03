// Inspired by JaKooLit, Retroed by Non-Sense Nostalgia
// CRT Minimal - Ultra-lightweight scanlines only
// 
// Bare minimum CRT effect for daily use with zero performance impact
// Place in ~/.config/hypr/shaders/

precision highp float;
varying vec2 v_texcoord;
uniform sampler2D tex;

// Minimal settings - just subtle scanlines
#define SCANLINE_STRENGTH 0.02    // Very subtle (barely visible)
#define SCANLINE_COUNT 540.0      // Match ~half your vertical resolution

void main() {
    vec2 uv = v_texcoord;
    vec4 color = texture2D(tex, uv);
    
    // Simple scanlines
    float scanline = sin(uv.y * SCANLINE_COUNT * 3.14159) * 0.5 + 0.5;
    color.rgb *= 1.0 - (scanline * SCANLINE_STRENGTH);
    
    gl_FragColor = color;
}
