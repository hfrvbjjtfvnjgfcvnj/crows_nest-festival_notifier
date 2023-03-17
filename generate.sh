#!/bin/bash

input="${1}";
output="${2}";

if [ "" == "${input}" ] ;
then
	echo "Usage: ${0} path_to/input/file.txt path_to/output/file.wav"
	exit 1
fi

voice="$(cat best_voice.txt)"

text2wave -o "${output}" -eval '(voice_'${voice}')' "${input}"

