# 🔊🖼️ Final Project: Digital Signal Processing (DSP) in MATLAB

This project is the culmination of the Signals and Systems course, applying fundamental theories to practical **Audio** and **Image Processing** tasks. The implementations are designed to be general and reusable, showcasing core DSP concepts in the MATLAB environment.

## 🧠 Module 1: Audio Processing (Time and Frequency Domain)

**Objective:** Denoising a noisy audio signal and manipulating its playback speed.

| Feature | Concept Implemented | Key MATLAB Tools |
| :--- | :--- | :--- |
| **Analysis** | Time-Domain, Magnitude Spectrum (FFT), Spectrogram | `audioread`, `fft`, `fftshift`, `spectrogram` |
| **Denoising** | Ideal **Low-Pass Filter** (LPF) in the Frequency Domain | Custom filter creation (zeroing out high frequencies), `ifft` |
| **Tempo Change** | Speed modification by adjusting the **Sampling Rate** | `audiowrite` with manipulated `rate` |

## results 

![images](https://github.com/MahdisSep/CV-Fundamentals-Mini-Projects/blob/main/calculate_area/chale.png)
![images](https://github.com/MahdisSep/CV-Fundamentals-Mini-Projects/blob/main/detect%20skin/initial2/initial/skin%20Detected/image_one.png)
![images](https://github.com/MahdisSep/CV-Fundamentals-Mini-Projects/blob/main/detect%20skin/initial2/initial/skin%20Detected/image_three.png)
![images](https://github.com/MahdisSep/CV-Fundamentals-Mini-Projects/blob/main/tic_tac_toe/initial/Data/O%20Wins.png)
![images](https://github.com/MahdisSep/CV-Fundamentals-Mini-Projects/blob/main/tic_tac_toe/initial/Data/X%20Wins.png)

* you can see the output audio by clicking on these links:
*
-----

## 🧠 Module 2: Image Processing (Spatial Domain)

**Objective:** Implementing and applying custom 2D convolution for various image filtering effects.

| Feature | Concept Implemented | Key MATLAB Tools |
| :--- | :--- | :--- |
| **Core Function** | Custom **2D Convolution** (`conv2D.m`) | Implementation of the mathematical definition, **Stride**, **Same Padding** |
| **Edge Detection** | Sobel and Robert filters for horizontal/vertical and diagonal gradient detection | Predefined Kernels |
| **Sharpening** | High-pass style filtering using a **Sharpening Kernel** | Kernel implementation |
| **Blurring/Smoothing** | **Gaussian** and **Averaging** filters for noise reduction and smoothing | 5x5 Kernels |

## 🚀 Getting Started

1.  **Clone the Repository:** Download the entire project structure.
2.  **Audio:** Place `noisy_tlou.wav` in `Part_01_Audio_Processing/`.
    * Run `soal1.m` (creates `clean.wav`).
    * Run `soal1b.m` (creates `slow.wav` and `fast.wav`).
3.  **Image:** Place your test image (e.g., `goodfellow.png`) in `Part_02_Image_Processing/images/`.
    * Run `question2.m`.
