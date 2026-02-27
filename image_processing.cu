#include <stdio.h>
#include <cuda_runtime.h>

__global__ void grayscale(unsigned char *input, unsigned char *output, int width, int height)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int size = width * height;

    if (idx < size)
    {
        output[idx] = input[idx] / 2; // simple processing
    }
}

int main()
{
    int width = 1024;
    int height = 1024;
    int size = width * height;

    unsigned char *h_input = new unsigned char[size];
    unsigned char *h_output = new unsigned char[size];

    for (int i = 0; i < size; i++)
        h_input[i] = i % 256;

    unsigned char *d_input, *d_output;

    cudaMalloc(&d_input, size);
    cudaMalloc(&d_output, size);

    cudaMemcpy(d_input, h_input, size, cudaMemcpyHostToDevice);

    grayscale<<<(size+255)/256, 256>>>(d_input, d_output, width, height);

    cudaMemcpy(h_output, d_output, size, cudaMemcpyDeviceToHost);

    printf("Processing Complete on GPU\\n");

    cudaFree(d_input);
    cudaFree(d_output);
    delete[] h_input;
    delete[] h_output;

    return 0;
}
