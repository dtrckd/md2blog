to adjust a 16:9 screen, do

    cvt 1366 76

	# 1368x768 59.88 Hz (CVT) hsync: 47.79 kHz; pclk: 85.25 MHz
    Modeline "1368x768_60.00"   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync

Copy what after Modeline, and paste it like so

    xrandr --newmode "1368x768_60.00"   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync

Then

    xrandr --addmode VGA-1 1368x768_60.00   # not that the reslution is an the best approcimation §µ$¤?

Then the new mode should selectionable.





