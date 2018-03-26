@recipes
@system

# File Format Converter

* [http://heckyesmarkdown.com](http://heckyesmarkdown.com]: HTML to markdown (non free)
* [http://domchristie.github.io/to-markdown/](http://domchristie.github.io/to-markdown/): HTML to markdown (free)
* [https://devotter.com/converter](https://devotter.com/converter): Universal Text Document Converter (use Pandoc)


# Music

### webm to mp4
     for f in *.webm; do ffmpeg -i "$f" -qscale 0 "${f%.webm}".mp4; done


