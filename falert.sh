#!/bin/bash

TITLE="${1}"
TEXT="${2}"
PRIORITY="${3}"
SOUND="${4}"
URL="${5}"

DIR="$(dirname "$(realpath "${0}")")"
cd "${DIR}"

#echo "TEXT:|${TEXT}|"

SOUNDFILE="$(find audio -iname "${SOUND}*")"
echo "Using Sound File: ${SOUNDFILE}"

#TEXT="$(echo "${TEXT}" | grep 'Operator\|Model\|Bearing\|ICAO')"

OPERATOR="$(echo "${TEXT}" | grep Operator | cut -f2 -d ":")"
MODEL="$(echo "${TEXT}" | grep Model | cut -f2 -d ":")"
BEARING="$(echo "${TEXT}" | grep Bearing | cut -f2 -d ":" | cut -f2 -d ' ')"
ICAO_TYPE="$(echo "${TEXT}" | grep 'ICAO Type' | cut -f2 -d ":" | sed 's/./& /g')"
FAA_TYPE="$(echo "${TEXT}" | grep 'FAA Type' | cut -f2 -d ":")";
DISTANCE="$(echo "${TEXT}" | grep 'Distance' | cut -f2 -d ":")"

echo "OPERATOR:${OPERATOR}"
echo "MODEL:${MODEL}"
echo "BEARING:${BEARING}"
echo "ICAO_TYPE:${ICAO_TYPE}"
echo "FAA_TYPE:${FAA_TYPE}"
echo "DISTANCE:${DISTANCE}"


tmp="$(mktemp -d)"
echo "${OPERATOR}... ${MODEL}... TYPE ${ICAO_TYPE} ${FAA_TYPE}... BEARING ${BEARING} DEGREES... ${DISTANCE}" > "${tmp}/note.txt"
cp "tones/notification_tone.wav" "${tmp}/0.wav"
cp "${SOUNDFILE}" "${tmp}/1.mp3"
./generate.sh "${tmp}/note.txt" "${tmp}/2.wav"

AFILE="alert$(date '+%Y-%m-%d_%H-%M-%S').tgz"

pushd "${tmp}"
tar -czf "${AFILE}" *

"${DIR}/play.sh" "${AFILE}"

popd

rm -rf "${tmp}"

