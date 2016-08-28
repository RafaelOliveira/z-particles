#version 100

#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D tex;
varying vec2 texCoord;
varying vec4 color;

void kore() {
	vec4 texcolor = texture2D(tex, texCoord);	
	gl_FragColor = vec4(
        texcolor.r * texcolor.a * color.r,
        texcolor.g * texcolor.a * color.g,
        texcolor.b * texcolor.a * color.b,
        texcolor.a * color.a
    );
}