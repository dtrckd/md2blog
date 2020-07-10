@recipes
@system
@cv
@linux
@convert

Text Format
-----------

* [http://heckyesmarkdown.com](http://heckyesmarkdown.com]: HTML to markdown (non free)
* [http://domchristie.github.io/to-markdown/](http://domchristie.github.io/to-markdown/): HTML to markdown (free)
* [https://devotter.com/converter](https://devotter.com/converter): Universal Text Document Converter (use Pandoc)


docx to tex

    pandoc --wrap=none --chapters -s foo.docx -o bar.tex

doc to tex

    antiword myfile.doc > myfile.txt ; pandoc -o myfile.tex myfile.txt

docx to txt

    textutil -convert txt worddoc.docx

txt to docx, using Times New Roman 12pt

    txt to Word, using Times New Roman 12pt


Music
-----


m4a
    ffmpeg -i test.m4a -acodec mp3 -ac 2 -ab 192k test.mp3

mp4
    ffmpeg -i test.mp4 -vn -acodec libmp3lame -ac 2 -ab 160k -ar 48000 test.mp3

ogg
    ffmpeg -i test.ogg -c:a libmp3lame -q:a 2 test.mp3 # avconv
    :a
    :q
    :q

flac
    ffmpeg -i test.flac -qscale:a 0 test.mp3

wav
    ffmpeg -i test.wav -acodec mp3 -ab 64k test.mp3

webm
    ffmpeg -i test.webm -qscale 0 test.mp4


Loop exmple
    for f in *.ogg; do avconv -i "$f" -c:a libmp3lame -q:a 2 "${f/ogg/mp3}"; done




Image
-----

control compression quality

    convert -quality 25 im.bmp im.jpeg

mettre du texte dans image:

    convert -size 150x50 xc:none -matte -pointsize 20 -fill #ffffff80 -draw "text 10,30 'Mon copyright'" miff:- | composite -tile - photo.jpg resultat.jpg

rotate image without loosing quality

    convert -density 300 a.pdf -rotate 180 b.pdf
