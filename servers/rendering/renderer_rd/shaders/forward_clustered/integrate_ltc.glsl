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

    vec4 ltc1 = vec4(LTC1[idx+0], LTC1[idx+1],LTC1[idx+2],LTC1[idx+3]);
    vec4 ltc2 = vec4(LTC2[idx+0], LTC2[idx+1],LTC2[idx+2],LTC2[idx+3]);

    imageStore(ltc1_image, pos, ltc1);
    imageStore(ltc2_image, pos, ltc2);
}