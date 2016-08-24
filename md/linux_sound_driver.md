@sound
@linux


source: http://www.troubleshooters.com/linux/sound/sound_troubleshooting.htm

[Troubleshooters.Com](../../troubleshooters.htm), [Linux
Library](../index.htm), and [Linux Sound Studio](./index.htm) Present:

Troubleshooting Linux Sound

[Copyright © 2013 by Steve
Litt](http://www.troubleshooters.com/cpyright.htm)

<div id="monthfea" class="monthfea">

See the [Troubleshooters.Com
Bookstore](http://www.troubleshooters.com/bookstore/).

</div>

CONTENTS:

-   [Disclaimer](#disclaimer)
-   [Introduction](#introduction)
-   [Overview of Linux Sound](#overview_of_linux_sound)
-   [The Steve Litt Diagnostic Tools](#the_steve_litt_diagnostic_tools)
-   [Sound Troubleshooting Script: Go fast or go
    home](#sound_troubleshooting_script_go_fast_or_go_home)
-   [Other Diagnostic Tools](#other_diagnostic_tools)
-   [Troubleshooting Sound Drivers](#troubleshooting_sound_drivers)
-   [Exotic Stuff and Rumors](#exotic_stuff_and_rumors)
-   [Establish a Baseline](#establish_a_baseline)

Disclaimer
==========

Troubleshooting audio can actually be dangerous if you do things like
test wearing earphones or test on a huge capacity amplifier. <span
class="warning">NEVER test audio wearing headphones!</span> This
document assumes you work in a safe way. We are not responsible for
outcome, or even injury, associated with your use of this document. If
that's not acceptable, you may not read this document and you may not
use its tools. You are fully responsible for the outcome of your sound
troubleshooting.

Introduction
============

I love Linux, but at certain times I curse it. Like when I can't get the
sound to play. So many entangled components, so little guidance. This
document introduces a few scripts you can use to make Linux sound
troubleshooting quicker and easier.

Overview of Linux Sound {#overview_of_linux_sound}
=======================

This section gives the world's most oversimplified overview of Linux
sound. But for typical Linux sound problems, the oversimplification is
good enough, and possibly just what you need.

![Simplified diagram of Linux sound](images/mm_sound.svg)

In the preceding diagram, the farther left you move, the greater the
level of abstraction. When you play a .wav file on <span
class="code">mplayer</span>, <span class="code">mplayer</span> knows all
about playing songs, handling playlists, going louder and softer or
going backward or forward through the song, but it knows almost nothing
about the system on which it operates. You can set it to interface with
abstract sound interfaces, and in this case, you set it to interface
with PulseAudio.

Pulseaudio handles sound streams very well. It can route sound streams
hither and yon. Through its <span class="code">pavucontrol</span> mixer,
it can provide volume controls for every application playing through it.
And it also provides volume controls for inputs like mikes and outputs
like speakers, although it comes nowhere near to operating directly on
mikes and speakers. Pulseaudio also has a nice Application Programming
Interface so you can make your own computer programs interface with it.

<div class="note">

NOTE:

Although the preceding diagram looks like Pulseaudio passes the sound to
ALSA, their relationship is more complex. One indication of this is that
when you increase a level in Pulseaudio, the corresponding ALSA level
increases, and when you increase an ALSA level, the corresponding
Pulseaudio level increases. In a way, you can think of Pulseaudio more
as a controller of ALSA than a preprocessor to ALSA.

</div>

If you do think of Pulseaudio as more of an ALSA controller than a
cascade step before it, then the following diagram is more accurate for
the situation:

![Simplified diagram of Linux sound, with Pulseaudio as controller for
ALSA](images/mm_sound_pulse_controller.svg)

When evaluating which of the two diagrams to use (and there are probably
other diagrams appropriate for various situations), keep in mind that
some software outputs to ALSA, some to Pulseaudio, and with some
softare, like qmmp, you can set it to output to one or the other.

Anyway, ALSA outputs to the the sound card driver, and is the last
hardware-independent part of the chain. It has less capability than
Pulseaudio. For instance, it cannot provide individual volume controls
for every stream going through it.

<div class="note">

NOTE:

ALSA can be set to output to the old Linux sound system, oss, but today,
it usually outputs to the driver.

</div>

ALSA has several excellent programs that aid in both adjustment and
troubleshooting:

-   aplay
-   arecord
-   amixer
-   alsamixer
-   speaker-test

aplay
-----

This is ALSA's music player, and it's also great for learning what's
going on. Its input into ALSA isn't quite as direct as you might think,
and it can play only certain sound formats, so its troubleshooting value
as a sound injector is limited, perhaps not as good as <span
class="code">mplayer</span>. But its value as a research tool is
unparallelled. For instance, here's the quick way to find all the sound
cards in a system:

<div class="code">

slitt@mydesk:\~\$ aplay -l \*\*\*\* List of PLAYBACK Hardware Devices
\*\*\*\* card 0: Intel \[HDA Intel\], device 0: ALC883 Analog \[ALC883
Analog\] Subdevices: 0/1 Subdevice \#0: subdevice \#0 card 0: Intel
\[HDA Intel\], device 1: ALC883 Digital \[ALC883 Digital\] Subdevices:
1/1 Subdevice \#0: subdevice \#0 slitt@mydesk:\~\$

</div>

In the preceding command, it found two devices, one analog and one
digital, on my sound card. You can get a list of all PCMs with the <span
class="code">-L</span> (uppercase, not lower) option, but it outputs so
much stuff it's not shown in this document.

arecord
-------

The <span class="code">arecord</span> program is to recording and input
what <span class="code">aplay</span> is to playback and output. So you
can use <span class="code">arecord</span> to record a .wav file, and you
can also use the <span class="code">-l</span> flag to list input
devices, as follows:

<div class="code">

slitt@mydesk:\~\$ arecord -l \*\*\*\* List of CAPTURE Hardware Devices
\*\*\*\* card 0: Intel \[HDA Intel\], device 0: ALC883 Analog \[ALC883
Analog\] Subdevices: 0/1 Subdevice \#0: subdevice \#0 card 0: Intel
\[HDA Intel\], device 2: ALC883 Analog \[ALC883 Analog\] Subdevices: 1/1
Subdevice \#0: subdevice \#0 card 1: HD3000 \[Microsoft® LifeCam
HD-3000\], device 0: USB Audio \[USB Audio\] Subdevices: 0/1 Subdevice
\#0: subdevice \#0 slitt@mydesk:\~\$

</div>

The preceding listing shows all input devices: One analog and one
digital device on my computer's built-in sound card, and a USB Audio on
my Microsoft webcam. Just like s<span class="cod">aplay</span>, s<span
class="cod">arecord</span> also features the s<span
class="cod">-L</span> parameter to view PCMs. As a matter of fact,
s<span class="cod">aplay</span> and s<span class="cod">arecord</span>
are really the same program, and either can be made into each other with
the s<span class="cod">-P</span> switch for playing, or the s<span
class="cod">-C</span> switch for recording.

amixer
------

<span class="code">amixer</span> serves two purposes:

1.  Command line/shellscript mixer interface to ALSA controls
2.  Diagnostic tool

In my opinion it's also more stable and dependable than any of ALSA's
more interactive mixers such as <span class="code">alsamixer</span> and
<span class="code">alsamixergui</span>. Here are some uses of <span
class="code">amixer</span> as a command line/shellscript mixer interface
to ALSA:

-   Home brew alarm clock: Start with volume low so you don't get jolted
    out of bed, and slowly raise the volume until your alarm is
    screaming out your wakeup song (Surfin-Bird always does it for me.)
-   Home brew media player: Audacious, Totem, Rhythmbox are all very
    nice, but if you ever decide to roll your own media player (perhaps
    you want one with a CLI interface), your software can control levels
    using <span class="code">amixer</span> commands.
-   Quick, problem free mute: You're blasting away listening to the
    Beastie Boys, when your boss conference calls you with the new, hard
    to please customer, and the 60 year old owner of your company. Now
    let's see, which of your workspaces has your media player? Which one
    has your mixer? Man, you better find it before the Beastie Boys
    gripe about Mom throwing out that porno mag, or you're going to
    look bad. OR, you could press Ctrl+Shift+= to "mute" it instantly,
    with a script causing <span class="code">amixer</span> to get and
    save the master volume, and set the master volume to zero. After the
    phone call, another script uses <span class="code">amixer</span> to
    restore the master volume to its old setting. By setting the master
    volume to zero instead of setting a mute on a control, you avoid all
    sorts of problems with mutes causing other mutes, requiring
    mucho troubleshooting.
-   Your playlist has great songs, but they're recorded at all sorts of
    different volume levels, and it's annoying. You make a database of
    songs and their relative volumes, and a script to change the volume,
    via <span class="code">amixer</span> so the songs all sound the
    same volume.

Using <span class="code">amixer</span> as a diagnostic tool is even
better. You already know the card number of the card you need
information on (remember how you used <span class="code">aplay</span>
and <span class="code">arecord</span> to get a card list?). Now, armed
with the card number (assume it's 0 for this example), you can get a
list of that card's controls like this:

amixer -c0 scontrols

Perhaps you want to see a list of the controls with all the settings for
each control. No problem, watch this:

amixer -c0 scontents

The output of the preceding is huge, but if you're any good at all with
the AWK parsing language, you can find out anything you need and turn it
into exactly what you want by parsing the output of that command with
your AWK script. As a matter of fact, my diagnostic tools work exactly
that way.

alsamixer
---------

Alsamixer is the ncurses based mixer for ALSA. It's great for changing
volumes and quick observations, but I've found it buggy and hard to use.

speaker-test
------------

The <span class="code">speaker-test</span> program provides a nice, easy
way to provide input for your sound system. When used with no arguments,
it simply supplies white noise to both speakers. I like to use it like
this:

speaker-test -c2 -t wav

The preceding plays <span class="code">.wav</span> files that
alternately say "left speaker" and "right speaker" out of alternate
speakers, thereby testing your stereo separation. If you have more than
2 channels, put the number of channels in the <span
class="code">-c</span> argument.

What I like about <span class="code">speaker-test</span> is that it
doesn't depend on Firefox, Youtube, mplayer, or anything else that, in
and of itself, might have problems. Once you have everything working
with <span class="code">speaker-test</span>, you can then troubleshoot
anything that doesn't work, like Youtube, knowing that the problem is
there, not in your sound system itself.

The Steve Litt Diagnostic Tools {#the_steve_litt_diagnostic_tools}
===============================

<div class="danger">

DANGER

Never do sound diagnosis wearing headphones. A sudden loud noise could
cause deafness, possibly permanent.

Likewise, never diagnose sound problems with a high power sound system
turned up loud, as this could also cause hearing problems, and a sudden
impulse could cause electrical problems, possibly blowing the speakers
or amp, or in extreme situations, perhaps cause a fire.

</div>

As you know from [my books](http://www.troubleshooters.com/bookstore),
I'm a big fan of process in troubleshooting. But sometimes, the best way
to start the process is with a quick predefined diagnostic likely to
work. This is what the Steve Litt Diagnostic Tools help do. You can
[download them here](downloads/litt_alsa_diag001.tgz).

There are two of these tools:

1.  ./unmute\_all.sh

    -   This unmutes all currently muted ALSA controls, enabling a quick
        solution to many problems.

2.  ./find\_all\_mutes.sh

    -   This shows all muted controls, better enabling you to find the
        root cause when your computer repeatedly drops sounds via mutes.

The way these tools work is you put them in a directory all by
themselves, and run them within that directory. They are not meant to
put on the path, and I don't recommend modifying them to put them on the
path.

<div class="note">

NOTE:

I've found out that these scripts won't find all sound cards on certain
computers, so they might fail to unmute all mutes. So, if the one second
<span class="code">./unmute\_all.sh</span> doesn't restore the sound,
run <span class="code">alsamixer</span>, cycle through every sound card
using the F6 key, and unmute every control with an "MM" at the bottom.

</div>

Sound Troubleshooting Script: Go fast or go home {#sound_troubleshooting_script_go_fast_or_go_home}
================================================

Troubleshooting Linux sound can consume horrendous amounts of time.
Life's too short and precious for such time wasters: We need a better
way, and this is it: Diagnostic tests based on likelihood and ease,
combined with <span class="code">./unmute\_all.sh</span> a shellscript
that unmutes all ALSA mutes.

In my troubleshooting classes and books I teach the quadruple tradeoff
to optimally choose the next diagnostic test:

-   Even divisions
-   Ease
-   Likelihood
-   Safety

I tell every class that you <span class="emph">never</span> perform
unsafe diagnostic tests; if you can't make it safe, you don't do it at
all. No using a 2 foot screwdriver pressed against your ear to listen to
various engine parts for a hum. No tests on an Inter Continental
Ballistic Missile while the nuclear warhead is attached. And no
headphones while diagnosing computer sound problems!

Linux sound troubleshooting is so difficult and so time consuming that
I've created a predefined diagnostic (a troubleshooting script) that
hopefully will solve 90% of the problems in 10% of the time. The
priority in designing this script was ease and likelihood, because with
Linux sound, even divisions are difficult to understand, and as long as
you're not using headphones or a powerful amp, I can't imagine an unsafe
test. Here's the predefined diagnostic:

![Flowchart of diagnostic
script](images/tshoot_script.svg){#predefined_diagnostic width="60%"
height="60%"}

This script is built for speed on typical problems. Obviously, you start
by checking whether it already works: No use messing up something that
works. If it doesn't, the next step is to unmute all controls on all
relevant sound cards, and please keep in mind that one physical sound
card can have multiple virtual sound cards.

Just for quickness, you might try my <span
class="code">./unmute\_all.sh</span> shellscript to quickly turn off all
ALSA mutes. But I've found out that <span
class="code">./unmute\_all.sh</span> doesn't find all virtual sound
cards on certain computers, so if <span
class="code">./unmute\_all.sh</span> doesn't fix the problem, you'll
need to run <span class="code">alsamixer</span>, cycle through all sound
cards using the F6 key, and turn off all mutes.

<div class="note">

NOTE:

Personally, I think that mutes in Linux sound are the bain of my
existence, due to the way they're implemented. Muting one control can
mute several others, sometimes on other virtual sound cards, and
unmuting it sometimes doesn't unmute those others, so you get a magical,
seemingly unfixable sound problem. If you need to eliminate sound from
your speakers, it's much better to set the master control to zero, and
then when you need it again, turn it up again. You could even write a
shellscript using amixer to get the master level, save it, turn it to
zero, and restore it when you press enter. I leave that as an exercise
for the reader.

<div class="note">

NOTE FURTHER:

I've seen an old distro that, when you turn the volume down to zero,
mutes the control. As far as I'm concerned, this misbehavior is perfect
justification to get another distro.

</div>

</div>

I'd imagine ALSA mutes account for half of all sound problems, and some
of the (formerly) most difficult ones, so taking this step now enables
you to solve half the problems in three minutes or less. Then you just
go right down the line. This predefined diagnostic won't solve all sound
problems, but it will solve most of them, and do it quickly. Even those
it doesn't solve will benefit from the results of the diagnostic tests.

What is the Penny Test?
-----------------------

The penny test is a test to test your speakers, from the plug that goes
into your sound card right through the electronics and speaker drivers.
Here's the penny test:

Unplug your speakers from the computer (but not from the wall), and rub
an American penny or other copper coin along the side of the speaker
plug. You should hear static clicks, and if you listen carefully, when
the penny touches the tip or the metal adjacent to the tip, you'll hear
a low volume buzz. If you don't hear any of these things, increase the
volume, make sure the speakers are plugged into power and turned on, and
try again. If you still don't hear it, your speaker system is probably
bad, so swap in a known good set of computer speakers.

<div class="note">

NOTE:

The penny technique won't work on headphones (earphones), but to protect
your hearing, you should <span class="emph">never</span> troubleshoot
audio problems wearing earphones anyway.

</div>

Other Diagnostic Tools {#other_diagnostic_tools}
======================

When testing a sound system, I'd recommend this command:

speaker-test -c2 -t wav

The preceding command is a direct injection of sound into the ALSA
system that, if all is working, should keep saying "front left" and
"front right" in alternating speakers. This is much easier and more
foolproof than playing a sound file with a sound playing executable, or
using YouTube.

My <span class="code">./unmute\_all.sh</span> is wonderful for the
simplest of all reasons: It might fix your problem in five seconds. If
it doesn't, then, just for fun, take another five seconds to run <span
class="code">./find\_all\_mutes.sh</span> to see if something obvious is
happening (wrong card, for instance?).

You can see whether ALSA sees any sound cards with the following
command:

aplay -l

<div class="note">

NOTE:

The preceding command finds cards with outputs. If you're looking for
cards with inputs (microphones, for instance), use this command:

arecord -l

</div>

Linux sound has evolved into a rather strange system. Pulseaudio doesn't
just pass sound on to ALSA: Pulseaudio levels actually control ALSA
levels and vice versa. If you can't find anything wrong using <span
class="code">alsamixer</span>, try <span
class="code">pavucontrol</span>, Pulseaudio's mixer application.

If no cards show up, or if the only card that shows up is a
microphone-only, then that's what you have to fix.

The following hardware-scanning command shows whether any working sound
cards exist:

lspci -v | grep -B1 -A12 -i audio

If you don't see evidence of the sound card in that output, your sound
card is probably bad, or it's not a PCI soundcard (perhaps it's USB?).
Unless you're sure it's a PCI soundcard, just to rule out the
possibility of a non-PCI soundcard, execute this command:

sudo lshw | grep -B4 -A10 -i audio

The <span class="code">lshw</span> is inferior to the <span
class="code">lspci</span> one because it's slower and requires root
privileges, but it detects sound cards <span
class="emph">anywhere</span> on the bus.

One thing that probably would <span class="emph">not</span> cause the
sound card to fail to show in <span class="code">lspci</span> or <span
class="code">lshw</span> commands would be a lack of drivers. I say this
based on an experiment I did, in which I created file <span
class="code">/etc/modules.d/blacklist-littsound.conf</span>, to
blacklist all the sound modules listed in <span
class="code">lsmod</span>. When I rebooted, <span
class="code">lspci</span> still showed the sound card. The computer
wouldn't make sound, and <span class="code">lsmod</span> showed no sound
drivers, but <span class="code">lspci</span> still showed the hardware.

So, although I'm not certain, I'm pretty sure that if your sound card
doesn't show up in either <span class="code">lspci</span> or <span
class="code">lshw</span>, that means either you have no sound card, the
sound card is defective, or a motherboard sound card is disabled in the
BIOS. So that's what you should start fixing.

If it shows up in <span class="code">lspci</span> or <span
class="code">lshw</span>, and you've unmuted everything with the Steve
Litt <span class="code">./unmute\_all.sh</span> tool, it's probably
either a zero level in ALSA, or a mute or zero in Pulsaudio (use <span
class="code">pavucontrol</span> to investigate), or it's a driver
problem. Driver problems are a pain and a half, so look at <span
class="code">alsamixer</span> and <span class="code">pavucontrol</span>
to make sure there are no mutes or zero levels.

Troubleshooting Sound Drivers {#troubleshooting_sound_drivers}
=============================

A sound driver is a small piece of software linking the hardware sound
card to the sound part of the operating system. In order for sound to
come out your speakers, you need sound drivers matching your sound card
to be loaded in memory. The reason I suggest troubleshooting sound
drivers last is that they're difficult and time consuming to
troubleshoot. When you seem to have ruled out everything else,
investigate sound drivers. Here are some questions you should have in
mind before starting to troubleshooting sound drivers:

-   What is the right sound driver for the card?
-   Is that sound driver loaded?
-   Are supporting sound drivers loaded?
-   Is the correct sound driver installed on the computer?
-   Why is the correct sound driver not being loaded?
    -   Conflict with another driver?
    -   Blacklisting?
    -   Failure to load a supporting driver?
    -   Wrong driver?
    -   Wrong version of the driver?
    -   Something else?

Here are some of the tools you'll use to diagnose and fix driver
problems:

-   <span class="code">lspci</span> and <span class="code">lshw</span>
-   <span class="code">lsmod</span>
-   <span class="code">modprobe</span>
-   <span class="code">modinfo</span>
-   <span class="code">rmmod</span>
-   <span class="code">dmesg</span>
-   The blacklist system
-   Rebooting

As far as which driver to use with the card, <span
class="code">lspci</span> is of great help. Sometimes it straight out
tells you the driver. See this:

<div class="code">

slitt@mydesk:\~\$ lspci -v | grep -i -A7 audio 00:1b.0 Audio device:
Intel Corporation 82801I (ICH9 Family) HD Audio Controller (rev 02)
Subsystem: ASUSTeK Computer Inc. Device 8277 Flags: bus master, fast
devsel, latency 0, IRQ 45 Memory at fe974000 (64-bit, non-prefetchable)
\[size=16K\] Capabilities: Kernel driver in use: snd\_hda\_intel Kernel
modules: snd-hda-intel slitt@mydesk:\~\$

</div>

As you see, <span class="code">lspci</span> gave the name of the driver,
<span class="code">snd\_hda\_intel</span>. But even if it hadn't, just
knowing that the hardware device is the Intel 82801I (ICH9 Family) helps
you research the proper driver on the Internet. Once you know the right
driver, and have installed it on your computer, you can load it with
<span class="code">modprobe</span> and test whether it loaded using
<span class="code">lsmod</span>.

If it's not loading, research on the Internet whether there are
conflicts with other, unnecessary drivers, and if so, blacklist those
conflicting drivers (learn more about blacklisting on the Internet). If
you suspect it's the wrong version, see if you can obtain the right one.

Driver troubleshooting is a bear. Your best resource is Internet
research, asking friends, and a lot of thought and experimentation.

Exotic Stuff and Rumors {#exotic_stuff_and_rumors}
=======================

I hope you never need to get this far, because the things in this
section are more of a wing-and-a-prayer situation than systematic
troubleshooting. But when prayers are all you have left, that's what you
do.

Do enough web research, and you hear strange stories. A guy added <span
class="code">options snd-hda-intel model=hp-m4</span> to a new file
<span class="code">/etc/modprobe.d/snd-hda-intel.conf</span> to get the
laptop's internal speakers to work, after getting the symptom where only
the headphones worked. Discussions of modifying <span
class="code">/var/tmp/alsaconf.cards</span> or <span
class="code">/var/lib/alsa/asound.state</span>. Conflicts between oss,
ALSA and/or Pulseaudio. Sometimes you need to spend time reading and
trying this stuff, and eventually something might work.

Troubleshooting with qmmp
-------------------------

qmmp is a graphical player very much like the old xmms. The cool thing
about it is that in the configuration, you can tell qmmp where you want
its output to go: ALSA, Pulseaudio, oss, Jack, or several other places.
Play a song on repeat, and change between them until you get something
that makes sound. Then try to adapt your ALSA, Pulseaudio or (gulp) oss
to do the same thing.

<div class="note">

NOTE:

oss is the original Linux sound system. It has pretty much been replaced
by ALSA, but some people have oss installed because some old software
can play only through oss. Unless you absolutely need oss, don't install
it. I've heard rumors of it conflicting with ALSA (works fine on my
computer, but who knows).

</div>

There's other software offering similar troubleshooting benefits as
qmmp. The old xmms is one, assuming you can find it any more. Xmms has
morphed into a command prompt software with its xmms2, and the project's
official GUI player is something called promoe. Good luck with promoe if
your vision isn't 20/10: It's the size of two postage stamps with tiny
writing and unfathomable icons. Xmms2 itself would be a great resource
for anyone remembering all its commands.

Boot a Different Distro
-----------------------

I do this all the time, with all sorts of problems. Video doesn't work?
Boot Knoppix. Or System Rescue CD. Or Xubuntu. Same with sound. When
you've spent a couple hours ripping your hair out over a sound problem,
the ten minutes required to boot a live CD and test suddenly seems a lot
shorter. If you <span class="emph">do</span> get a distro to make sound
when the original distro didn't, get all the information you can using
<span class="code">lspci</span> and <span class="code">lsmod</span> and
various commands like <span class="code">amixer</span>, <span
class="code">aplay</span> and the like. Look at config files. Exploiting
the differences between a working and a nonworking system is a very
powerful troubleshooting tactic you can use.

Establish a Baseline {#establish_a_baseline}
====================

This is a must! You must establish a baseline.

Before your sound system breaks, or once you get your sound working,
write down how it works. In a directory in your backed up data, write
the output of your <span class="code">lspci -v command</span>, your
<span class="code">lsmod</span> command, your <span class="code">aplay
-l</span> and <span class="code">arecord -l</span> commands. Keep a copy
of your <span class="code">/etc/modprobe.d</span> directory; it's not
very big. Maybe keep in your directory a narrative of what you did to
get the sound working.

Be sure to know what all cards in <span class="code">alsamixer</span>
look like, and what all the tabs in <span
class="code">pavucontrol</span> look like.

Linux sound is much easier to both understand and troubleshoot when you
know what a working system looks like. Give yourself that gift so your
next troubleshoot will be easier.
