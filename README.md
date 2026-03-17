# Digital Modulation BER Simulation in MATLAB

## Overview
This repository contains a modular MATLAB simulation designed to evaluate the performance of digital modulation schemes, specifically **M-ary Quadrature Amplitude Modulation (M-QAM)** and **M-ary Phase Shift Keying (M-PSK)**, over an Additive White Gaussian Noise (AWGN) channel. 

The project calculates and plots the Bit Error Rate (BER) against the Signal-to-Noise Ratio (Eb/N0), providing a clear visual comparison between Monte Carlo simulation results and theoretical bounds.

## Features
* **Modular Design:** Functions for modulation, demodulation, channel noise, and metric calculations are separated into individual scripts for reusability.
* **Modulation Schemes:** Supports both `M-QAM` (Square QAM with $M = 4, 16, 64, 256$) and `M-PSK`.
* **Gray Coding:** Implements Gray code mapping for optimized symbol-to-bit assignment to minimize BER.
* **Custom Detection:** Uses Minimum Euclidean Distance detection for symbol recovery.
* **Theoretical vs. Simulated:** Automatically plots simulated curves against exact theoretical formulas.

## File Structure
| File | Description |
| :--- | :--- |
| `BER.m` | **Main Script.** Sets parameters, runs the simulation loop, and plots the final BER vs. Eb/N0 curves. |
| `add_noise.m` | Custom function to add AWGN based on the specified Signal-to-Noise Ratio. |
| `modulate.m` / `demodulate.m` | Wrapper functions to call the specific digital modulation/demodulation techniques. |
| `mqam_modulator.m` / `mqam_detector.m` | Functions to modulate and detect M-QAM symbols. |
| `constructQAM.m` | Constructs the ideal Gray-coded reference constellation for M-QAM. |
| `dec2gray.m` | Utility function to convert decimal inputs to Gray code representation. |
| `minEuclideanDistance.m` | Computes pairwise minimum distance to decode received symbols based on the reference constellation. |
| `Theoretical_BER.m` | Calculates the exact theoretical Symbol Error Rate for various modulations to validate the simulation. |

## How to Run
1. Clone the repository to your local machine:
   ```bash
   git clone [https://github.com/G-ALI007/MQAM-BER-Simulation-MATLAB.git](https://github.com/G-ALI007/MQAM-BER-Simulation-MATLAB.git)
Open MATLAB and navigate to the cloned directory.

Open BER.m.

Run the script. The simulation is set by default to test QAM for M = [4, 16, 64, 256] over an Eb/N0 range of -5 to 20 dB.

A plot will automatically generate showing the theoretical and simulated BER curves.

Author
Ghader Ali Telecommunications Engineer & Software Developer
