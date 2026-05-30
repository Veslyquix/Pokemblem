import librosa
import numpy as np
import os
import sys

# I don't think this script works properly 

filename = "rawWAVs/273.wav"

if not os.path.exists(filename):
    print(f"Error: File not found → {filename}")
    sys.exit(1)

try:
    # Load audio (mono)
    y, sr = librosa.load(filename, sr=None)

    # Estimate pitch using YIN
    f0 = librosa.yin(y,
                     fmin=librosa.note_to_hz('C2'),  # adjust range if needed
                     fmax=librosa.note_to_hz('C7'))

    # Take the most common (mode) pitch across time
    f0 = f0[~np.isnan(f0)]  # remove unvoiced frames
    if len(f0) == 0:
        print("No pitch detected.")
        sys.exit(1)

    pitch_hz = np.median(f0)  # median is robust against outliers
    note_name = librosa.hz_to_note(pitch_hz)

    print(f"Detected pitch: {pitch_hz:.2f} Hz")
    print(f"Closest note: {note_name}")

except Exception as e:
    print(f"Error: Could not process file '{filename}'")
    print("Details:", str(e))
