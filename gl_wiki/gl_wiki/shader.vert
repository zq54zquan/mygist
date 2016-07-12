#version 410 core

layout (location=0) in vec3 Position;
layout (location=1) in vec3 color;
out vec4 outcolor;
uniform mat4x4 gworld;
void main() {
    gl_Position = gworld * vec4(Position.x,Position.y,Position.z,1.0);
    outcolor = vec4(color,1.0);
}