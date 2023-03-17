# crows_nest_plugins

Plug-in notifier implementations for https://github.com/hfrvbjjtfvnjgfcvnj/crows_nest


# festival_alerts
Audio notifications utilizing the Festival Text-to-Speech plaform.

Dependencies:
- generate.sh -> text2wave (provided by festival tts)
- tones/sine.sh -> ffmpeg

Configure:
- generate or symlink tones/notification_tone.wav (can use tones/sine.sh to generate a sine wave)
- install alert sounds to audio/ (each filename should start with the alert_type_name ex: 'loiter_XXXXX.mp3')
- create and populate play.sh to perform desired notification action (play audio, transfer audio files to another host, etc)



