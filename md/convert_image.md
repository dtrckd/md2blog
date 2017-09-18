@video
@linux
@X

% control compression quality
convert -quality 25 im.bmp im.jpeg

% mettre du texte dans image:
convert -size 150x50 xc:none -matte -pointsize 20 -fill #ffffff80 -draw "text 10,30 'Mon copyright'" miff:- | composite -tile - photo.jpg resultat.jpg


