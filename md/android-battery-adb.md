@android
@eos
@fairphone
@battery
@adb

# Android battery drain (/e/OS, Fairphone 4)

## adb setup (Debian)

    sudo apt install adb android-sdk-platform-tools-common
    sudo usermod -aG plugdev $USER          # if `adb devices` shows "no permissions"

Phone: Settings > About phone > tap Build number x7, then Developer options > USB debugging.

    adb devices                             # accept prompt on phone; must show "device", not "unauthorized"

Disable USB debugging when done (grants persist).

## GSam Battery Monitor (no root)

    adb shell pm list packages | grep gsam  # com.gsamlabs.bbm or com.gsamlabs.bbm.pro
    adb shell pm grant com.gsamlabs.bbm android.permission.BATTERY_STATS
    adb shell appops set com.gsamlabs.bbm GET_USAGE_STATS allow
    adb shell dumpsys package com.gsamlabs.bbm | grep BATTERY_STATS   # granted=true

Force-stop and reopen GSam after granting.

## BetterBatteryStats (alternative)

    pkg=com.asksven.betterbatterystats_xdaedition   # Play build: com.asksven.betterbatterystats
    adb shell pm grant $pkg android.permission.BATTERY_STATS
    adb shell pm grant $pkg android.permission.DUMP
    adb shell pm grant $pkg android.permission.PACKAGE_USAGE_STATS

May be refused on recent Android (16); fall back to dumpsys.

## Raw stats (always works)

    adb shell dumpsys batterystats --charged | less
    adb shell dumpsys batterystats --charged | grep -i -A3 nfc
    adb bugreport bugreport.zip             # load in Battery Historian

## Usual culprits (FP4)

- NFC service (com.android.nfc): keeps polling for tags. Fix: turn NFC off when unused. (Confirmed fix after /e/OS 4.3.1.)
- Modem: force 4G only (no 5G); an old SIM can cause drain.
- microG: open bug https://gitlab.e.foundation/e/backlog/-/work_items/9117
- Advanced Privacy: Tor ("Hide my IP") and fake location.
- Bluetooth stuck: reboot.
- After a major update, wait ~1 week (Android re-optimizes apps).
- Isolate third-party apps: reboot into safe mode.
