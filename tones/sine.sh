#!/bin/bash

ffmpeg -f lavfi -i "sine=frequency=1000:duration=3" sine_1khz.wav
