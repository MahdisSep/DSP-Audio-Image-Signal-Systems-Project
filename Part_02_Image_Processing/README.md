# Part 02 - Image Processing: 2D Convolution and Filtering (MATLAB)

## 🌟 Project Overview

This module is dedicated to **Image Processing** using **Two-Dimensional Convolution (2D Convolution)**. The primary task was to implement a custom, generalized 2D convolution function and apply various standard filtering kernels to an input image to achieve effects like **Edge Detection**، **Sharpening**، and **Blurring**.

The project demonstrates a deep understanding of how LTI systems (Linear Time-Invariant Systems) function in the spatial domain to modify visual information.

## ✨ Key Functions and Implementation

### 1\. Custom 2D Convolution Implementation (`conv2D.m`)

A custom function `conv2D` was created to perform the core filtering operation without relying on MATLAB's built-in functions like `conv2` or `filter2`.

  * **Function Signature:**
    ```matlab
    function [feature_map] = conv2D(img, filters, stride, padding)
    ```
  * **Core Logic:** Implements nested loops to iterate over all dimensions of the image.
  * **Padding Support:** Correctly handles the `'same'` padding mode, ensuring the output feature map has the same dimensions as the input image by zero-padding the borders based on the filter size $f$ (where $p = (f-1)/2$).
  * **Multi-Channel Support:** Allows filtering of RGB images by applying the filter across all color channels (C) and summing the results for each output pixel.
  * **Stride Support:** Implements the `stride` parameter to control the step size of the filter window.

### 2\. Filter Application and Analysis (`question2.m`)

This script defines three sets of filters (Layer 1, Layer 2, Layer 3) and applies them to an input image (`goodfellow.png`) using the custom `conv2D` function.

#### 🔸 Layer 1 Kernels (3x3 - Fine Details)

  * **Bottom Sobel & Top Sobel:** Edge detection filters that highlight horizontal gradients.
  * **Sharpening:** A filter that enhances high-frequency details to make the image appear sharper.
  * **Weighted Averaging (3x3):** A basic blurring filter using a weighted kernel.

#### 🔹 Layer 2 Kernels (2x2 - Efficiency and Simplicity)

  * **Robert X & Robert Y:** Simpler edge detection kernels (2x2) that are often sensitive to 45-degree and 135-degree diagonals.
  * **Averaging (2x2):** A simple box blur filter.

#### 🔸 Layer 3 Kernels (5x5 - Smoothing and Blurring)

  * **Gaussian (5x5):** A smoothing filter that removes Gaussian noise by calculating a weighted average based on the Gaussian distribution.
  * **Averaging (5x5):** A larger box blur for stronger smoothing.

### 3\. Visualization and Data Handling

  * **Display:** Uses `subplot` and `imshow` to display the original image alongside the filtered feature maps.
  * **Normalization:** Emphasizes the critical step of normalizing the output of 2D convolution using `mat2gray` and casting to `uint8(255 * ...)` to ensure the pixel values are correctly scaled (0-255) and displayed by MATLAB without clipping or artifacts.

## ⚙️ Technologies Used

| Category | Technology | Purpose |
| :--- | :--- | :--- |
| **Language/Environment** | MATLAB | Core environment. |
| **Functions** | `imread`, `imshow`, `cat`, `uint8`, `mat2gray`, `size`, `zeros` | Image I/O, visualization, data manipulation, and filter stacking. |
| **Custom Function** | `conv2D.m` | Core implementation of 2D convolution logic. |

## 🚀 How to Run

1.  Ensure the `conv2D.m` and `question2.m` files are in the same directory.
2.  Ensure the input image (`goodfellow.png` or any desired image) is available in a sub-directory named `images/`.
3.  Execute `question2.m` in the MATLAB Command Window.

