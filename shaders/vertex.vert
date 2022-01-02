#version 330 core
layout (location = 0) in vec3 position;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 lodColor;
layout (location = 3) in float biome;

out vec3 o_normal;
out vec3 pos;
out vec3 lod_color;
out float vert_biome;

uniform mat4 M,V,P;
void main() {
	gl_Position = P * V * M * vec4(position, 1.0);
	pos = vec3(M * vec4(position, 1.0));
	o_normal = mat3(M) * normal; //upper left 3x3 matrix of mv matrix 
	lod_color = lodColor;
	vert_biome = biome;
}