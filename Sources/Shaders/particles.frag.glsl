#version 450

precision mediump float;

uniform sampler2D tex;
in vec2 texCoord;
in vec4 color;
out vec4 fragColor;

void kore() {
	vec4 texcolor = texture(tex, texCoord);	
	fragColor = vec4(
        texcolor.r * texcolor.a * color.r,
        texcolor.g * texcolor.a * color.g,
        texcolor.b * texcolor.a * color.b,
        texcolor.a * color.a
    );
}