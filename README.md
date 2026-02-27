# CUDA Image Processing Project

**Student Name:** Jude Clement Jose G  
**Course:** CUDA at Scale – Independent Project  
**GPU Used:** NVIDIA Tesla T4 (Google Colab)  
**CUDA Version:** 12.8  

---

## 📌 Project Overview

This project implements GPU-accelerated image processing using CUDA.  
The program processes a large batch of images using custom CUDA kernels and measures performance against CPU execution.

The goal is to demonstrate practical GPU parallelization and analyze performance improvements using CUDA streams and device kernels.

---

## ⚙️ Technologies Used

- CUDA C++
- NVIDIA Tesla T4 GPU
- Google Colab
- NVCC (CUDA 12.8)
- Python (for benchmarking and visualization)

---

## 🚀 Features Implemented

- GPU-based image processing kernel
- Batch processing of 200 images
- CUDA memory management (Host ↔ Device)
- CUDA stream execution timing
- Performance benchmarking (CPU vs GPU)
- Speedup analysis

---

## 🖥 Execution Details

### Sample Output

Processing Complete on GPU

CPU Time: 23.90 seconds  
GPU Time: 24.21 seconds  
GPU Stream Time: 24.24 seconds  

Speedup GPU vs CPU: 0.986  
Speedup Stream vs CPU: 0.985  

Processed 200 images on GPU  
Total GPU Time: 4.107 seconds  

---

## 📊 Performance Analysis

Although GPU acceleration introduces parallel execution, performance depends on:

- Memory transfer overhead
- Kernel launch overhead
- Problem size
- GPU utilization efficiency

For large-scale datasets, GPU acceleration becomes significantly more beneficial.

---

