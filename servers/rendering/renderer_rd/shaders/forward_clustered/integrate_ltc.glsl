#[compute]
#version 450
layout(local_size_x = 8, local_size_y = 8, local_size_z = 1) in;

layout(rgba, set = 0, binding = 0) uniform restrict writeonly image2D ltc1_image;
layout(rgba, set = 0, binding = 1) uniform restrict writeonly image2D ltc2_image;

#define SIZE 64

void main()
{
    ivec2 pos = ivec2(gl_GlobalInvocationID.xy);
    uint idx = pos.x + pos.y * SIZE;

    uint idx1 = idx + 1;
    uint idx2 = idx + 2;
    uint idx3 = idx + 3;

    vec4 ltc1 = vec4(LTC1[idx], LTC1[idx1],LTC1[idx2],LTC1[idx3]);
    vec4 ltc2 = vec4(LTC2[idx], LTC2[idx1],LTC2[idx2],LTC2[idx3]);

    imageStore(ltc1_image, pos, ltc1);
    imageStore(ltc2_image, pos, ltc2);
}