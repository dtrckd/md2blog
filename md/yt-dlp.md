yt-dlp cheat sheet

[Skip to main content](#main){.visually-hidden .focusable}

::: website-header
::: wrapper
::: {itemscope="" itemtype="https://schema.org/Brand"}
[![Ditig.com
logo](/assets/graphics/logo.svg "Go to Ditig.com home page"){.logo__image
height="41" itemprop="logo" width="103"} [ Ditig ]{.visually-hidden
itemprop="name"} [ Discover Information Technology ]{.logo__tagline
itemprop="slogan"}](/){.logo content="https://www.ditig.com"
itemprop="url"}
:::

::: {#search .search}
:::
:::
:::

::: wrapper
## Primary Navigation {#primary-navigation .visually-hidden}

[ [ Toggle menu ]{.visually-hidden} ]{.navigation-global__menu-button}

-   [Home](/ "Home page"){.navigation-global__anchor}
-   [HTML](/html "Learn HyperText Markup Language (HTML)"){.navigation-global__anchor}
-   [CSS](/css "Learn Cascading Style Sheets (CSS)"){.navigation-global__anchor}
-   [JS](/javascript "Learn JavaScript (JS)"){.navigation-global__anchor}
-   [Linux](/linux "Learn GNU/Linux"){.navigation-global__anchor}
-   [Scripting](/scripting "Learn scripting"){.navigation-global__anchor}
-   [Git](/git "Learn Git version control"){.navigation-global__anchor}
-   [Vim](/vim "Learn Vim text editor"){.navigation-global__anchor}
-   [Tmux](/tmux "Learn terminal multiplexer tmux"){.navigation-global__anchor}
-   [Cmus](/cmus "Learn C* Music Player"){.navigation-global__anchor}
-   [Cheat
    Sheets](/cheat-sheet "Collection of cheat sheets"){.navigation-global__anchor}
-   [Tools](/tools "Development and editing tools"){.navigation-global__anchor}
:::

::: {#main role="main"}
::: wrapper
::: icyds-article-header
[Command-line Video & Audion Downloading[:]{.visually-hidden}]{.kicker}

# yt-dlp cheat sheet {#yt-dlp-cheat-sheet itemprop="headline"}

::: summary
## Summary {#summary .visually-hidden}

![](/assets/graphics/yt-dlp-cheat-sheet.svg){.visual height="140"
itemprop="thumbnailUrl" width="140"}

This `yt-dlp` cheat sheet explains command-line options for downloading
video, audio, subtitles, playlists, and livestreams, plus format
control, cookies, and proxy use. Includes a comprehensive `yt-dlp`
command reference table.
:::

Published:
:   2025-08-04
    <div>

    Updated:
    2025-10-27

    </div>

    <div>

    Reading time:
    05:35

    </div>

    <div>

    Author:
    [[Jonas Jared Jacek]{itemprop="name"}](#author){itemprop="author"
    itemscope="" itemtype="https://schema.org/Person" rel="author"}

    </div>

    <div>

    Tags:
    [yt-dlp](/yt-dlp){rel="category tag"}, [cheat
    sheet](/cheat-sheet){rel="category tag"},
    [bash](/bash){rel="category tag"}

    </div>

    <div>

    License:
    [CC BY-SA 4.0](#license){itemprop="license"}

    </div>

    <div>

    Permalink:
    [yt-dlp cheat
    sheet](/yt-dlp-cheat-sheet "This yt-dlp cheat sheet explains command-line options for downloading video, audio, subtitles, playlists, and livestreams. Contains a yt-dlp command reference table."){itemprop="url"
    content="/yt-dlp-cheat-sheet"}

    </div>
:::

## Table of contents

1.  [Introduction](#introduction)
2.  [Downloading](#downloading)
    1.  [Basic download](#basic-download)
    2.  [Download entire playlist](#download-entire-playlist)
    3.  [Batch download from file](#batch-download-from-file)
    4.  [Download only new videos from a
        playlist](#download-only-new-videos-from-a-playlist)
    5.  [Download shorts or clips without full
        playlist](#download-shorts-or-clips-without-full-playlist)
    6.  [Download livestream](#download-livestream)
3.  [Audio and subtitle handling](#audio-and-subtitle-handling)
    1.  [Download only audio](#download-only-audio)
    2.  [Extract audio without
        re-encoding](#extract-audio-without-re-encoding)
    3.  [Download subtitles with video](#download-subtitles-with-video)
    4.  [Download chapters as separate
        files](#download-chapters-as-separate-files)
4.  [Format selection](#format-selection)
    1.  [Specify format manually](#specify-format-manually)
    2.  [Common format selection
        examples](#common-format-selection-examples)
5.  [Output naming and file handling](#output-naming-and-file-handling)
    1.  [Set custom output filename](#set-custom-output-filename)
    2.  [Use more template variables](#use-more-template-variables)
    3.  [Avoid temporary or partial
        files](#avoid-temporary-or-partial-files)
    4.  [Split into chapters](#split-into-chapters)
6.  [Metadata and thumbnails](#metadata-and-thumbnails)
    1.  [Embed metadata and thumbnail](#embed-metadata-and-thumbnail)
    2.  [Download livestream chat](#download-livestream-chat)
7.  [Authentication and cookies](#authentication-and-cookies)
    1.  [Use cookies from file](#use-cookies-from-file)
    2.  [Use browser cookies directly](#use-browser-cookies-directly)
8.  [Network and performance](#network-and-performance)
    1.  [Use a proxy](#use-a-proxy)
    2.  [Add custom HTTP headers](#add-custom-http-headers)
    3.  [Use external downloader](#use-external-downloader)
    4.  [Limit download speed](#limit-download-speed)
    5.  [Add random delays to avoid
        bans](#add-random-delays-to-avoid-bans)
9.  [Advanced features](#advanced-features)
    1.  [Re-encode to a different
        format](#re-encode-to-a-different-format)
    2.  [Use configuration file](#use-configuration-file)
10. [Troubleshooting and maintenance](#troubleshooting-and-maintenance)
    1.  [Skip errors and continue](#skip-errors-and-continue)
    2.  [Bypass SSL certificate issues](#bypass-ssl-certificate-issues)
    3.  [Show detailed output for
        debugging](#show-detailed-output-for-debugging)
    4.  [Update yt-dlp to latest
        version](#update-yt-dlp-to-latest-version)
11. [Command reference table](#command-reference-table)

```{=html}
<!-- -->
```
1.  [Frequently asked questions](#faqs)
2.  [Further readings](#sources)

## Introduction [\#](#introduction)

`yt-dlp`{.language-plaintext .highlighter-rouge} is a command-line tool
based on `youtube-dl`{.language-plaintext .highlighter-rouge} that
downloads videos and audio from websites such as YouTube, Vimeo, and
hundreds more. It includes features such as automatic format selection,
embedded subtitles, audio extraction, metadata embedding, cookie-based
authentication, and segmented livestream handling.

## Downloading [\#](#downloading)

### Basic download [\#](#basic-download)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp https://www.example.com/watch?v=example
```
:::
:::

Downloads the best available audio and video, and merges them into one
file using FFmpeg.

### Download entire playlist [\#](#download-entire-playlist)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp -o "%(playlist_index)s - %(title)s.%(ext)s" https://www.example.com/playlist?list=example
```
:::
:::

Downloads each item in the playlist and names it using its position and
title.

### Batch download from file [\#](#batch-download-from-file)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp -a urls.txt
```
:::
:::

Reads and downloads all URLs listed in `urls.txt`{.language-plaintext
.highlighter-rouge}. Each URL must be on its own line.

### Download only new videos from a playlist [\#](#download-only-new-videos-from-a-playlist)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --download-archive archive.txt --no-overwrites "PLAYLIST_URL"
```
:::
:::

Skips videos that were already downloaded. Video IDs are stored in
`archive.txt`{.language-plaintext .highlighter-rouge}.

### Download shorts or clips without full playlist [\#](#download-shorts-or-clips-without-full-playlist)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --no-playlist "SHORTS_URL"
```
:::
:::

Prevents yt-dlp from treating shorts or clips as part of an associated
playlist.

### Download livestream [\#](#download-livestream)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --hls-use-mpegts https://www.example.com/watch?v=live_id
```
:::
:::

Downloads an HLS livestream using MPEG-TS format. This prevents
corruption if interrupted.

## Audio and subtitle handling [\#](#audio-and-subtitle-handling)

### Download only audio [\#](#download-only-audio)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp -x --audio-format mp3 https://www.example.com/watch?v=example
```
:::
:::

Extracts audio and converts it to MP3. Requires FFmpeg.

### Extract audio without re-encoding [\#](#extract-audio-without-re-encoding)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp -x --audio-format best --no-keep-video "URL"
```
:::
:::

Extracts the best audio stream without re-encoding. Original audio
format is preserved.

### Download subtitles with video [\#](#download-subtitles-with-video)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --write-subs --sub-lang en --embed-subs https://www.example.com/watch?v=example
```
:::
:::

Downloads English subtitles and embeds them into the video file.

### Download chapters as separate files [\#](#download-chapters-as-separate-files)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --split-chapters "URL" -o "%(title)s - %(chapter)s.%(ext)s"
```
:::
:::

Splits a video by its chapter markers and saves each chapter as a
separate file. Requires FFmpeg.

## Format selection [\#](#format-selection)

### Specify format manually [\#](#specify-format-manually)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp -f "bv*+ba" https://www.example.com/watch?v=example
```
:::
:::

Selects best video (`bv`{.language-plaintext .highlighter-rouge}) and
best audio (`ba`{.language-plaintext .highlighter-rouge}) streams for
merging.

### Common format selection examples [\#](#common-format-selection-examples)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp -f "best[height<=720]" "URL"
```
:::
:::

Downloads the best format with resolution 720p or lower.

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp -f "mp4" "URL"
```
:::
:::

Prefers formats in the MP4 container.

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp -f "bv[ext=webm]+ba[ext=m4a]" "URL"
```
:::
:::

Chooses specific video and audio stream extensions.

## Output naming and file handling [\#](#output-naming-and-file-handling)

### Set custom output filename [\#](#set-custom-output-filename)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp -o "~/Videos/%(title)s.%(ext)s" https://www.example.com/watch?v=example
```
:::
:::

### Use more template variables [\#](#use-more-template-variables)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp -o "%(upload_date>%Y-%m-%d)s - %(title)s.%(ext)s" "URL"
```
:::
:::

This example uses the `upload_date`{.language-plaintext
.highlighter-rouge} field formatted as `YYYY-MM-DD`{.language-plaintext
.highlighter-rouge}.

### Avoid temporary or partial files [\#](#avoid-temporary-or-partial-files)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --no-part --no-continue https://www.example.com/watch?v=example
```
:::
:::

Disables creation of `.part`{.language-plaintext .highlighter-rouge}
files and disables resuming.

### Split into chapters [\#](#split-into-chapters)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --split-chapters -o "%(title)s - %(chapter)s.%(ext)s" "URL"
```
:::
:::

Creates separate output files for each chapter using the chapter title.

## Metadata and thumbnails [\#](#metadata-and-thumbnails)

### Embed metadata and thumbnail [\#](#embed-metadata-and-thumbnail)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --embed-metadata --embed-thumbnail https://www.example.com/watch?v=example
```
:::
:::

Adds video metadata and thumbnail image into the output file.

### Download livestream chat [\#](#download-livestream-chat)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --write-chat "LIVE_URL"
```
:::
:::

Saves live chat messages as a `.json`{.language-plaintext
.highlighter-rouge} file. Only works for platforms that support chat.

## Authentication and cookies [\#](#authentication-and-cookies)

### Use cookies from file [\#](#use-cookies-from-file)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --cookies cookies.txt https://www.example.com/watch?v=restricted
```
:::
:::

### Use browser cookies directly [\#](#use-browser-cookies-directly)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --cookies-from-browser firefox "URL"
```
:::
:::

Extracts cookies directly from Firefox. Also supports Chrome and
Chromium.

## Network and performance [\#](#network-and-performance)

### Use a proxy [\#](#use-a-proxy)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --proxy socks5://127.0.0.1:9050 https://www.example.com/watch?v=example
```
:::
:::

### Add custom HTTP headers [\#](#add-custom-http-headers)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --add-header "User-Agent: CustomAgent/1.0" https://example.com/video
```
:::
:::

### Use external downloader [\#](#use-external-downloader)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --external-downloader aria2c --external-downloader-args "-x 16 -k 1M" https://www.example.com/watch?v=example
```
:::
:::

### Limit download speed [\#](#limit-download-speed)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --limit-rate 500K https://www.example.com/watch?v=example
```
:::
:::

Limits bandwidth usage to 500 kilobytes per second.

### Add random delays to avoid bans [\#](#add-random-delays-to-avoid-bans)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --sleep-interval 5 --max-sleep-interval 10 "URL"
```
:::
:::

Introduces a random delay between downloads from 5 to 10 seconds.

## Advanced features [\#](#advanced-features)

### Re-encode to a different format [\#](#re-encode-to-a-different-format)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --recode-video mp4 https://www.example.com/watch?v=example
```
:::
:::

Re-encodes the video to MP4 format using FFmpeg after download.

### Use configuration file [\#](#use-configuration-file)

Example file: `~/.config/yt-dlp/config`{.language-plaintext
.highlighter-rouge}

::: {.language-text .highlighter-rouge}
::: highlight
``` highlight
--format bv*+ba
--merge-output-format mp4
--embed-thumbnail
--embed-metadata
--write-subs
--sub-lang en
--output ~/Videos/%(title)s.%(ext)s
```
:::
:::

This file is read automatically if placed in the default location or
specified with `--config-location`{.language-plaintext
.highlighter-rouge}.

## Troubleshooting and maintenance [\#](#troubleshooting-and-maintenance)

### Skip errors and continue [\#](#skip-errors-and-continue)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --ignore-errors "URL"
```
:::
:::

Skips videos that fail to download and continues with the next.

### Bypass SSL certificate issues [\#](#bypass-ssl-certificate-issues)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --no-check-certificate "URL"
```
:::
:::

Ignores invalid SSL certificates. This is insecure and should be avoided
unless necessary.

### Show detailed output for debugging [\#](#show-detailed-output-for-debugging)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp --verbose "URL"
```
:::
:::

Prints verbose logs for debugging purposes.

### Update yt-dlp to latest version [\#](#update-yt-dlp-to-latest-version)

::: {.language-bash .highlighter-rouge}
::: highlight
``` highlight
yt-dlp -U
```
:::
:::

Checks for and installs the latest available version of
`yt-dlp`{.language-plaintext .highlighter-rouge}.

## Command reference table [\#](#command-reference-table)

Command

Description

`yt-dlp URL`{.language-plaintext .highlighter-rouge}

Downloads the best available video and audio.

`yt-dlp -x --audio-format mp3 URL`{.language-plaintext
.highlighter-rouge}

Extracts audio and converts it to MP3 using FFmpeg.

`yt-dlp -x --audio-format best --no-keep-video URL`{.language-plaintext
.highlighter-rouge}

Extracts audio without re-encoding and deletes the video.

`yt-dlp --write-subs --sub-lang en --embed-subs URL`{.language-plaintext
.highlighter-rouge}

Downloads and embeds English subtitles into the video.

`yt-dlp --write-auto-subs URL`{.language-plaintext .highlighter-rouge}

Downloads automatically generated subtitles.

`yt-dlp -f "bv*+ba" URL`{.language-plaintext .highlighter-rouge}

Downloads best video and best audio and merges them.

`yt-dlp -F URL`{.language-plaintext .highlighter-rouge}

Lists all available video and audio formats.

`yt-dlp -f "best[height<=720]" URL`{.language-plaintext
.highlighter-rouge}

Selects the best video with height 720p or lower.

`yt-dlp -f "mp4" URL`{.language-plaintext .highlighter-rouge}

Chooses formats in the MP4 container.

`yt-dlp -f "bv[ext=webm]+ba[ext=m4a]" URL`{.language-plaintext
.highlighter-rouge}

Selects specific formats for video and audio.

`yt-dlp -o "~/Videos/%(title)s.%(ext)s" URL`{.language-plaintext
.highlighter-rouge}

Sets a custom output filename and directory.

`yt-dlp -o "%(upload_date>%Y-%m-%d)s - %(title)s.%(ext)s" URL`{.language-plaintext
.highlighter-rouge}

Uses upload date and title in the filename.

`yt-dlp -o "%(playlist_index)s - %(title)s.%(ext)s" PLAYLIST_URL`{.language-plaintext
.highlighter-rouge}

Downloads a playlist with indexed filenames.

`yt-dlp --split-chapters -o "%(title)s - %(chapter)s.%(ext)s" URL`{.language-plaintext
.highlighter-rouge}

Downloads each chapter as a separate file.

`yt-dlp -a urls.txt`{.language-plaintext .highlighter-rouge}

Downloads all URLs listed in the `urls.txt`{.language-plaintext
.highlighter-rouge} file.

`yt-dlp --download-archive archive.txt --no-overwrites PLAYLIST_URL`{.language-plaintext
.highlighter-rouge}

Skips videos already downloaded and logs them to
`archive.txt`{.language-plaintext .highlighter-rouge}.

`yt-dlp --no-playlist SHORTS_URL`{.language-plaintext
.highlighter-rouge}

Avoids downloading full playlist when URL is a short or clip.

`yt-dlp --no-part --no-continue URL`{.language-plaintext
.highlighter-rouge}

Disables `.part`{.language-plaintext .highlighter-rouge} file and
disables resuming of downloads.

`yt-dlp --embed-metadata --embed-thumbnail URL`{.language-plaintext
.highlighter-rouge}

Embeds metadata and thumbnail into the downloaded file.

`yt-dlp --write-chat URL`{.language-plaintext .highlighter-rouge}

Downloads livestream chat messages as JSON.

`yt-dlp --cookies cookies.txt URL`{.language-plaintext
.highlighter-rouge}

Uses a cookie file for access-restricted content.

`yt-dlp --cookies-from-browser firefox URL`{.language-plaintext
.highlighter-rouge}

Extracts cookies directly from Firefox.

`yt-dlp --proxy socks5://127.0.0.1:9050 URL`{.language-plaintext
.highlighter-rouge}

Downloads via a SOCKS5 proxy.

`yt-dlp --add-header "User-Agent: CustomAgent/1.0" URL`{.language-plaintext
.highlighter-rouge}

Sends a custom HTTP header.

`yt-dlp --external-downloader aria2c --external-downloader-args "-x 16 -k 1M" URL`{.language-plaintext
.highlighter-rouge}

Uses `aria2c`{.language-plaintext .highlighter-rouge} for parallel
segment downloading.

`yt-dlp --limit-rate 500K URL`{.language-plaintext .highlighter-rouge}

Limits download speed to 500 KB/s.

`yt-dlp --sleep-interval 5 --max-sleep-interval 10 URL`{.language-plaintext
.highlighter-rouge}

Adds random sleep interval between downloads.

`yt-dlp --hls-use-mpegts URL`{.language-plaintext .highlighter-rouge}

Downloads HLS livestream using MPEG-TS for resilience.

`yt-dlp --recode-video mp4 URL`{.language-plaintext .highlighter-rouge}

Re-encodes downloaded file to MP4 using FFmpeg.

`yt-dlp --ignore-errors URL`{.language-plaintext .highlighter-rouge}

Skips errors and continues with remaining downloads.

`yt-dlp --no-check-certificate URL`{.language-plaintext
.highlighter-rouge}

Disables SSL certificate verification (not secure).

`yt-dlp --verbose URL`{.language-plaintext .highlighter-rouge}

Shows detailed log output for debugging.

`yt-dlp -U`{.language-plaintext .highlighter-rouge}

Updates `yt-dlp`{.language-plaintext .highlighter-rouge} to the latest
available version.

::: {.section .faqs itemscope="" itemtype="https://schema.org/FAQPage"}
## FAQ\'s [\#](#faqs)

Most common questions and brief, easy-to-understand answers on the
topic:

### Can `yt-dlp` download private or age-restricted videos? {#can-yt-dlp-download-private-or-age-restricted-videos itemprop="name"}

[Yes, `yt-dlp` can download these videos if you provide a valid cookie
file using the `--cookies` option.]{itemprop="text"}

### Does `yt-dlp` work with streaming playlists like M3U8? {#does-yt-dlp-work-with-streaming-playlists-like-m3u8 itemprop="name"}

[Yes, `yt-dlp` supports M3U8 and other streaming formats, and can
download them using segment stitching.]{itemprop="text"}

### How can I resume an interrupted download? {#how-can-i-resume-an-interrupted-download itemprop="name"}

[Use the `--no-part` option to prevent partial file cleanup. `yt-dlp`
resumes if the server supports byte ranges.]{itemprop="text"}

### Is ffmpeg required for audio or format conversion? {#is-ffmpeg-required-for-audio-or-format-conversion itemprop="name"}

[Yes, `yt-dlp` relies on `ffmpeg` for merging formats, extracting audio,
and applying re-encodings.]{itemprop="text"}

### What websites are supported by `yt-dlp`? {#what-websites-are-supported-by-yt-dlp itemprop="name"}

[`yt-dlp` supports over 1,000 websites including YouTube, Vimeo,
Dailymotion, and many regional, or livestreaming
platforms.]{itemprop="text"}
:::

## Further readings [\#](#sources) {#sources}

Sources and recommended, further resources on the topic:

-   [GitHub: yt-dlp
    repository](https://github.com/yt-dlp/yt-dlp){rel="external"}
-   [GitHub: yt-dlp README with options and
    usage](https://github.com/yt-dlp/yt-dlp/blob/master/README.md){rel="external"}
-   [Arch Linux: yt-dlp manual
    page](https://man.archlinux.org/man/extra/yt-dlp/yt-dlp.1.en){rel="external"}
-   [FFmpeg: Official site](https://ffmpeg.org/){rel="external"}
-   [yt-dlp: List of supported
    sites](https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md){rel="external"}

::: {.section .author}
## Author {#author .section-heading}

::: author__body
![Jonas Jared Jacek • J15k](/assets/graphics/j15k.svg){width="100"
height="100"}

<div>

### Jonas Jared Jacek (J15k)

Jonas works as project manager, web designer, and web developer since
2001. On top of that, he is a Linux system administrator with a broad
interest in things related to programming, architecture, and design.
See:
[https://www.j15k.com/](https://www.j15k.com/ "Jonas Jared Jacek (J15k)"){rel="author external"}

</div>
:::
:::

::: {.section .license}
## License {#license .section-heading}

[yt-dlp cheat sheet](/yt-dlp-cheat-sheet){property="dct:title"
rel="cc:attributionURL"} by [Jonas Jared
Jacek](https://www.j15k.com/){rel="cc:attributionURL dct:creator"
property="cc:attributionName"} is licensed under [CC BY-SA
4.0](https://creativecommons.org/licenses/by-sa/4.0/){target="_blank"
rel="license noopener noreferrer"}.

This license requires that reusers give credit to the creator. It allows
reusers to distribute, remix, adapt, and build upon the material in any
medium or format, for noncommercial purposes only. To give credit,
provide a link back to the original source, the author, and the license
e.g. like this:

    <p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/"><a property="dct:title" rel="cc:attributionURL" href="https://www.ditig.com/yt-dlp-cheat-sheet">yt-dlp cheat sheet</a> by <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://www.j15k.com/">Jonas Jared Jacek</a> is licensed under <a href="https://creativecommons.org/licenses/by-sa/4.0/" target="_blank" rel="license noopener noreferrer">CC BY-SA 4.0</a>.</p>

For more information see the Ditig [legal page](/legal).
:::

::: {.section .related-articles}
## Related Articles {#related-articles .section-heading}

[![](/assets/graphics/css-selectors-cheat-sheet.svg){.visual
height="140" itemprop="thumbnailUrl"
width="140"}](/css-selectors-cheat-sheet)

<div>

[Web Design[:]{.visually-hidden}]{.kicker}

### CSS selectors & combinators cheat sheet

Cheat sheet for Cascading Style Sheets (CSS) selectors and combinators.
Includes specificity score. Many examples of simple, compound and
complex selectors.

</div>

[![](/assets/graphics/ardour-cheat-sheet.svg){.visual height="140"
itemprop="thumbnailUrl" width="140"}](/ardour-cheat-sheet)

<div>

[Keyboard Bindings[:]{.visually-hidden}]{.kicker}

### Ardour cheat sheet

A concise Ardour cheat sheet that lists default keyboard shortcuts and
keybindings for the editor, mixer, MIDI, transport, and other windows,
organized by context.

</div>
:::

::: {.section .tag-list-section}
## All Topics {#all-topics .section-heading}

-   [[adb]{.tag-list__tag-name}[(3)]{.tag-list__tag-count}](/adb "Explore our complete collection of ADB (Android Debug Bridge) guides and tutorials. Learn how to use ADB commands for Android development, file transfer, device debugging, and advanced automation techniques."){.tag-list__anchor
    rel="category tag"}
-   [[Bash]{.tag-list__tag-name}[(6)]{.tag-list__tag-count}](/bash "Explore Bash - the interactive command interpreter and command programming language. Learn Bash scripting with tutorials and examples. Master command-line automation and shell scripting for system administration and development."){.tag-list__anchor
    rel="category tag"}
-   [[Best
    Practices]{.tag-list__tag-name}[(1)]{.tag-list__tag-count}](/best-practice){.tag-list__anchor
    rel="category tag"}
-   [[Cheat
    Sheets]{.tag-list__tag-name}[(37)]{.tag-list__tag-count}](/cheat-sheet "Explore comprehensive cheat sheets and quick reference guides. From web standards like HTML and CSS to Linux software. Curated collections of commands."){.tag-list__anchor
    rel="category tag"}
-   [[cmus]{.tag-list__tag-name}[(7)]{.tag-list__tag-count}](/cmus "Explore cmus guides and cheat sheets. Learn commands, create playlists, install cmus, stream music, and update your library with ease."){.tag-list__anchor
    rel="category tag"}
-   [[CSS]{.tag-list__tag-name}[(12)]{.tag-list__tag-count}](/css "Explore CSS guides and cheat sheets. Learn Flexbox vs. Grid, nth-child, selectors, combinators, and other essential techniques for modern web design."){.tag-list__anchor
    rel="category tag"}
-   [[cURL]{.tag-list__tag-name}[(3)]{.tag-list__tag-count}](/curl "Explore cURL guides, how-tos, and cheat sheets."){.tag-list__anchor
    rel="category tag"}
-   [[Design]{.tag-list__tag-name}[(5)]{.tag-list__tag-count}](/design "Explore design resources, including color palettes, Xterm 256 colors, and RGB to CMYK conversion for SVG files. Learn color formatting for web and print."){.tag-list__anchor
    rel="category tag"}
-   [[Email]{.tag-list__tag-name}[(7)]{.tag-list__tag-count}](/email "Explore email administration resources. Learn how to set up a custom email domain, email security, and how to use SPF, DKIM, and DMARC."){.tag-list__anchor
    rel="category tag"}
-   [[GIMP]{.tag-list__tag-name}[(1)]{.tag-list__tag-count}](/gimp "Explore GIMP - GNU Image Manipulation Program - guides and cheat sheets. Learn GIMP with tutorials, tips, and scripting techniques."){.tag-list__anchor
    rel="category tag"}
-   [[Git]{.tag-list__tag-name}[(6)]{.tag-list__tag-count}](/git "Explore Git version control guides and cheat sheets. Learn Git pull vs. fetch, handling files, and other essential Git commands."){.tag-list__anchor
    rel="category tag"}
-   [[GNU]{.tag-list__tag-name}[(6)]{.tag-list__tag-count}](/gnu "Explore GNU software guides, tutorials, and tools, including cheat sheets for AWK, grep, sed, and find. Master command-line text processing with GNU."){.tag-list__anchor
    rel="category tag"}
-   [[HTML]{.tag-list__tag-name}[(11)]{.tag-list__tag-count}](/html "Explore HTML guides, tutorials, and best practices. Learn about HTML elements, lists, void tags, spacing techniques, and web standards for modern development."){.tag-list__anchor
    rel="category tag"}
-   [[HTTP]{.tag-list__tag-name}[(4)]{.tag-list__tag-count}](/http "Explore HTTP guides, tutorials, and best practices."){.tag-list__anchor
    rel="category tag"}
-   [[JavaScript]{.tag-list__tag-name}[(6)]{.tag-list__tag-count}](/javascript "Explore JavaScript guides and tutorials. Learn about arrays, variables, RegExp, and best practices for modern web development with JavaScript."){.tag-list__anchor
    rel="category tag"}
-   [[jq]{.tag-list__tag-name}[(2)]{.tag-list__tag-count}](/jq "Explore a collection of jq tutorials, cheat sheets, recipes, and how-to guides for mastering JSON processing on the command line."){.tag-list__anchor
    rel="category tag"}
-   [[Linux]{.tag-list__tag-name}[(16)]{.tag-list__tag-count}](/linux "Explore Linux guides, cheat sheets, and tutorials. Learn Linux commands, scripting, system administration, package management, backups, and troubleshooting."){.tag-list__anchor
    rel="category tag"}
-   [[Liquid]{.tag-list__tag-name}[(5)]{.tag-list__tag-count}](/liquid "Explore Liquid template language guides and cheat sheets. Learn Liquid syntax, tags, filters, escaping techniques, and best practices."){.tag-list__anchor
    rel="category tag"}
-   [[Markdown]{.tag-list__tag-name}[(6)]{.tag-list__tag-count}](/markdown "Explore Markdown guides, cheat sheets, and syntax tutorials. Learn about code blocks, lists, spacing, and compare features of different Markdown parsers."){.tag-list__anchor
    rel="category tag"}
-   [[Privacy]{.tag-list__tag-name}[(4)]{.tag-list__tag-count}](/privacy "Explore the latest articles, tips, and best practices on web privacy. Learn about data protection."){.tag-list__anchor
    rel="category tag"}
-   [[Rsync]{.tag-list__tag-name}[(3)]{.tag-list__tag-count}](/rsync "Explore guides, tutorials, and tips on rsync – the file synchronization tool. Learn how to use rsync for backups, data transfers, and file syncing."){.tag-list__anchor
    rel="category tag"}
-   [[Scripting]{.tag-list__tag-name}[(18)]{.tag-list__tag-count}](/scripting "Explore scripting guides, cheat sheets, and tutorials. Learn Bash, JavaScript, JSON processing, text manipulation, automation, and command-line scripting."){.tag-list__anchor
    rel="category tag"}
-   [[Security]{.tag-list__tag-name}[(10)]{.tag-list__tag-count}](/security "Explore the latest articles, tips, and best practices on web security and IT security. Learn about data protection, vulnerability management, and secure coding techniques to safeguard your digital assets."){.tag-list__anchor
    rel="category tag"}
-   [[Standards]{.tag-list__tag-name}[(10)]{.tag-list__tag-count}](/standard "Explore technical and ISO standards, including HTTP status codes, HTML void elements, Linux exit codes, and ISO country and language codes."){.tag-list__anchor
    rel="category tag"}
-   [[Templates]{.tag-list__tag-name}[(2)]{.tag-list__tag-count}](/template "Explore technical templates for scripting, automation, and configuration, including robots.txt for web crawlers and backup scripts for system administration."){.tag-list__anchor
    rel="category tag"}
-   [[tmux]{.tag-list__tag-name}[(4)]{.tag-list__tag-count}](/tmux "Explore tmux tips, commands, and shortcuts. "){.tag-list__anchor
    rel="category tag"}
-   [[TOML]{.tag-list__tag-name}[(1)]{.tag-list__tag-count}](/toml "Explore a collection of articles, tutorials, and guides on TOML (Tom’s Obvious Minimal Language) – the human-readable config file format. Learn syntax, best practices, and advanced use cases."){.tag-list__anchor
    rel="category tag"}
-   [[Tools]{.tag-list__tag-name}[(8)]{.tag-list__tag-count}](/tools "Explore our collection of free online tools for web design, text formatting, content cleanup, character encoding, and text analysis. Convert units, format and clean text, encode HTML, and analyze content."){.tag-list__anchor
    rel="category tag"}
-   [[Vim]{.tag-list__tag-name}[(14)]{.tag-list__tag-count}](/vim "Explore Vim tips, commands, and shortcuts. Learn how to edit multiple files, manage tabs, delete lines, customize Vim with .vimrc, and improve your workflow."){.tag-list__anchor
    rel="category tag"}
-   [[VLC]{.tag-list__tag-name}[(3)]{.tag-list__tag-count}](/vlc "Explore VLC media player guides and cheat sheets."){.tag-list__anchor
    rel="category tag"}
-   [[Web
    development]{.tag-list__tag-name}[(33)]{.tag-list__tag-count}](/web-development "Explore web development topics, including HTML, CSS, and JavaScript. Learn coding techniques, browser configurations, and monetization strategies."){.tag-list__anchor
    rel="category tag"}
-   [[yt-dlp]{.tag-list__tag-name}[(2)]{.tag-list__tag-count}](/yt-dlp "Explore a collection of yt-dlp tutorials, cheat sheets, recipes, and how-to guides for mastering the feature-rich command-line audio/video downloader."){.tag-list__anchor
    rel="category tag"}
:::

::: {.section .quotes}
## Random Quote {#random-quote .section-heading}

<figure>
<blockquote>
<p>“Security is never “done” — it is a process, not a final
rest-state.”</p>
</blockquote>
<figcaption>Brendan Eich<span class="expertise"> American computer
programmer, creator of the JavaScript programming
language</span><span>brendaneich.com, 2014 - <a href="/quotes">IT
quotes</a></span></figcaption>
</figure>
:::
:::
:::

## Footer Navigation {#footer-navigation .visually-hidden}

::: {.wrapper .navigation-footer__sections}
::: section
### Editorial

-   [About](/about)
-   [Legal](/legal)
-   [Privacy](/privacy-policy)
-   [Sitemap](/sitemap)
:::

::: section
### Syndication

-   [Atom Feed](/feed-atom.xml "Ditig.com Atom feed"){rel="nofollow"
    target="_blank"}
-   [RSS Feed](/feed-rss.xml "Ditig.com RSS feed"){rel="nofollow"
    target="_blank"}
:::

::: section
### Connect

-   [![GitHub logo](/assets/graphics/github-logo.svg){height="40"
    width="40"} [ GitHub
    ]{.visually-hidden}](https://github.com/ditig-com "Ditig.com GitHub page"){rel="external nofollow me"
    target="_blank"}
-   [![GitLab logo](/assets/graphics/gitlab-logo.svg){height="40"
    width="40"} [ GitLab
    ]{.visually-hidden}](https://gitlab.com/ditig "Ditig.com GitHub page"){rel="external nofollow me"
    target="_blank"}
-   [![LinkedIn logo](/assets/graphics/linkedin-logo.svg){height="40"
    width="40"} [ LinkedIn
    ]{.visually-hidden}](https://www.linkedin.com/company/ditig/ "Ditig.com LinkedIn page"){rel="external nofollow me"
    target="_blank"}
-   [![Bluesky logo](/assets/graphics/bluesky-logo.svg){height="40"
    width="40"} [ Bluesky
    ]{.visually-hidden}](https://bsky.app/profile/ditig.com "Ditig.com Bluesky page"){rel="external nofollow me"
    target="_blank"}
:::
:::

::: wrapper
::: container
::: {itemscope="" itemtype="https://schema.org/Brand"}
[![Ditig.com
logo](/assets/graphics/logo.svg "Go to Ditig.com home page"){.logo__image
height="41" itemprop="logo" width="103"} [ Ditig ]{.visually-hidden
itemprop="name"} [ Discover Information Technology ]{.logo__tagline
itemprop="slogan"}](/){.logo content="https://www.ditig.com"
itemprop="url"}
:::

## About {#about .visually-hidden}

© 2026 Ditig.com.\
Unless otherwise indicated, all rights reserved.
:::
:::

![](https://queue.simpleanalyticscdn.com/noscript.gif?collect-dnt=true){referrerpolicy="no-referrer-when-downgrade"
height="0" width="0"}
