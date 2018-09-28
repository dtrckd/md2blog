@signal
@filter
@linux

# Filtering noise

## Sax

install

    sudo apt install sox libsox-fmt-*

extract noise sample, and nois profile

    ffmpeg -i source.mp3 -vn -ss 00:00:18 -t 00:00:20 noisesample.wav
    sox noisesample.wav -n noiseprof noise_profile_file

run noise reduction

    sox source.mp3 output.mp3 noisered noise_profile_file VALUE

where VALUE between 0 and 1. 0.3 is agressive, 0.2 kind of soft...
