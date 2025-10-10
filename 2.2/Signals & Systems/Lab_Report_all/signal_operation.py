import numpy as np
import matplotlib.pyplot as plt

# Parameters
t = np.arange(-10, 10, 0.01)  # Time vector

# Define two signals
x1 = np.sin(2 * np.pi * 1 * t)  # Signal 1: Sine wave
x2 = np.cos(2 * np.pi * 0.5 * t)  # Signal 2: Cosine wave

# Signal Addition
y_add = x1 + x2

# Signal Multiplication
y_mult = x1 * x2

# Amplitude Scaling
k = 2  # Scaling factor
y_scaled = k * x1

# Time Shifting
shift = 2  # Shift value (in seconds)
y_shifted = np.sin(2 * np.pi * 1 * (t - shift))  # Delayed signal

# Signal Folding
y_folded = np.sin(2 * np.pi * 1 * (-t))  # Folded sine wave

# Plot Results
plt.figure(figsize=(12, 15))

# Original Signals
plt.subplot(6, 1, 1)
plt.plot(t, x1, label='x1: Sine Wave', color='b')
plt.plot(t, x2, label='x2: Cosine Wave', color='r')
plt.title('Original Signals')
plt.legend()
plt.grid()

# Signal Addition
plt.subplot(6, 1, 2)
plt.plot(t, y_add, color='m')
plt.title('Signal Addition')
plt.grid()

# Signal Multiplication
plt.subplot(6, 1, 3)
plt.plot(t, y_mult, color='k')
plt.title('Signal Multiplication')
plt.grid()

# Amplitude Scaling
plt.subplot(6, 1, 4)
plt.plot(t, y_scaled, color='g')
plt.title('Amplitude Scaling')
plt.grid()

# Time Shifting
plt.subplot(6, 1, 5)
plt.plot(t, y_shifted, color='c')
plt.title('Time Shifting')
plt.grid()

# Signal Folding
plt.subplot(6, 1, 6)
plt.plot(t, y_folded, label='Folded Signal', color='purple')
plt.title('Signal Folding')
plt.legend()
plt.grid()

# Display the plots
plt.tight_layout()
plt.show()
