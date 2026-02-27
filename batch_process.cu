#include <stdio.h>
#include <cuda_runtime.h>

__global__ void invert(unsigned char *img, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size)
        img[idx] = 255 - img[idx];
}

extern "C"
void process_image(unsigned char *h_img, int size)
{
    unsigned char *d_img;
    cudaMalloc(&d_img, size);

    cudaMemcpy(d_img, h_img, size, cudaMemcpyHostToDevice);

    invert<<<(size+255)/256, 256>>>(d_img, size);
    cudaDeviceSynchronize();

    cudaMemcpy(h_img, d_img, size, cudaMemcpyDeviceToHost);

    cudaFree(d_img);
}
