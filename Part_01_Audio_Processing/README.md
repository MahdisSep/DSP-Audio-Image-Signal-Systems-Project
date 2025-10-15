# Part 01 - Audio Processing: Noise Filtering and Speed Modification (MATLAB)

## 🌟 Project Overview

This module focuses on applying **Digital Signal Processing (DSP)** techniques in the frequency domain to a real-world audio signal (`noisy_tlou.wav`). The primary objectives are to **denoise** the audio using a **Low-Pass Filter** implemented via the **Fast Fourier Transform (FFT)** and to modify the playback speed (tempo) of the cleaned audio.

The project demonstrates proficiency in time-domain and frequency-domain analysis, filter design, and fundamental audio manipulation using MATLAB's built-in functions.

## ✨ Key Functions and Implementation

### 1\. Audio Analysis and Visualization (`soal1.m` - Part 1)

  * **Reading:** Loads the noisy audio file, obtaining the signal array (`signal`) and the sampling rate (`r`).
  * **Time-Domain Plot:** Calculates the time vector (`t`) and plots the original signal's amplitude versus time, showing the signal's initial characteristics.
  * **Frequency-Domain (FFT) Plot:** Calculates the **FFT** of the signal. The result is then **shifted** (`fftshift`) to center the zero-frequency component, and the **magnitude spectrum** is plotted, clearly showing the frequency components and the location of the unwanted noise.
  * **Time-Frequency Analysis:** Generates a **Spectrogram** to visualize the signal's frequency content over time, providing a clear map of the noise characteristics.

### 2\. Noise Filtering via Low-Pass Filter (`soal1.m` - Part 2)

  * **Filter Design:** A **Low-Pass Filter** is implemented by creating a copy of the FFT result and setting all frequency components whose absolute frequency is **above 1000 Hz** to **zero**. This effectively removes the high-frequency noise while preserving the speech/music.
  * **Inverse FFT (iFFT):** The filtered spectrum is transformed back to the time domain using the **Inverse FFT** (`ifft`) and **Inverse FFT Shift** (`ifftshift`), resulting in the `low_pass_filter` signal.
  * **Visualization:** Plots the cleaned signal in the time domain and its corresponding spectrogram to visually confirm noise reduction.
  * **Output:** The cleaned signal is saved as a new WAV file (`clean.wav`) using `audiowrite`.

### 3\. Audio Speed Modification (`soal1b.m`)

This script takes the cleaned audio (`clean.wav`) and modifies its playback speed to half-speed (0.5x) and double-speed (2x). This is achieved by manipulating the **sampling rate (`rate`)** without altering the signal data itself.

  * **Tempo Slowing (0.5x):** The script sets the output sampling rate to `rate * 0.5`. When the original signal data is played back at a lower rate, the duration increases, and the tempo slows down.
  * **Tempo Speeding (2x):** The script sets the output sampling rate to `rate * 2`. When the original signal data is played back at a higher rate, the duration decreases, and the tempo speeds up.
  * **Visualization:** Plots the time-domain signal, the magnitude spectrum, and the spectrogram for both the 0.5x (slow) and 2x (fast) versions, confirming the change in the time scale and frequency domain representation.
  * **Output:** Generates `slow.wav` and `fast.wav` files.

## ⚙️ Technologies Used

| Category | Technology | Purpose |
| :--- | :--- | :--- |
| **Language/Environment** | MATLAB | Core environment for computation and visualization. |
| **Functions** | `audioread`, `audiowrite` | Reading and writing audio files. |
| **Transform** | `fft`, `ifft`, `fftshift`, `ifftshift` | Core tools for moving between time and frequency domains. |
| **Analysis** | `spectrogram`, `abs` | Visualizing time-frequency distribution and magnitude spectrum. |

## 🚀 How to Run

1.  Ensure the input file `noisy_tlou.wav` is in the same directory as the `.m` scripts.
2.  Open MATLAB and run `soal1.m` first. This generates the `clean.wav` file.
3.  Then, run `soal1b.m` to perform the speed modifications.

