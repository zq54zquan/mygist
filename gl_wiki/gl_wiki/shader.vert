#version 410 core

layout (location=0) in vec3 Position;
uniform mat4x4 gworld;
void main() {
    gl_Position = gworld * vec4(Position.x,Position.y,Position.z,1.0);
}