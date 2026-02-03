// CRT Phosphor Green - Hyprland Screen Shader
// Inspired by JaKooLit, Retroed by Non-Sense Nostalgia
// Scanlines + subtle vignette for CRT effect

#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

// Adjust these for more/less effect
const float scanlineStrength = 0.08;  // 0.0 = off, 0.15 = strong
const float scanlineCount = 540.0;    // Half your vertical resolution
const float vignetteStrength = 0.15;  // 0.0 = off, 0.3 = noticeable

void main() {
    vec4 pixColor = texture(tex, v_texcoord);
    vec3 color = pixColor.rgb;
    
    // Scanlines - darken alternating horizontal lines
    float scanline = sin(v_texcoord.y * scanlineCount * 3.14159265) * 0.5 + 0.5;
    color *= 1.0 - (scanline * scanlineStrength);
    
    // Vignette - darken edges/corners
    vec2 uv = v_texcoord;
    float vignette = uv.x * uv.y * (1.0 - uv.x) * (1.0 - uv.y);
    vignette = clamp(pow(vignette * 16.0, vignetteStrength), 0.0, 1.0);
    color *= vignette;
    
    fragColor = vec4(color, pixColor.a);
}
