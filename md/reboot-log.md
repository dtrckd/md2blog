# 🐧 Linux Boot & Boot Messages Cheatsheet

## 📅 Last Boot Time
```bash
uptime -s          # exact date/time
who -b             # boot time (short)
last reboot        # reboot history
```

## 📋 Boot Messages (current boot)
```bash
dmesg                    # kernel ring buffer
dmesg -T                 # with human-readable timestamps
journalctl -b            # systemd boot log (current boot)
```

## 🔍 List All Boots
```bash
journalctl --list-boots
```
Output:
```
-2 a1b2c3d... Mon 2024-01-15 08:00:00 — 18:30:00
-1 e5f6g7h... Mon 2024-01-15 18:35:00 — Tue 09:00:00
 0 i9j0k1l... Tue 2024-01-16 09:05:00 — now
```

## ⏮️ Last X Messages BEFORE a Given Boot

### With systemd (journalctl)
```bash
journalctl -b -1 -n 20              # last 20 lines of previous boot
journalctl -b -2 -n 20              # last 20 lines of 2 boots ago
journalctl -b <boot-id> -n 20       # using boot ID from --list-boots

journalctl -b -1 -n 50 -p err       # only errors
journalctl -b -1 | grep -iE "panic|oom|segfault|error"
```

### Without systemd (traditional syslog)
```bash
grep -n "Linux version" /var/log/syslog     # find boot start lines
sed -n '1,LINE_NUMp' /var/log/syslog | tail -20
```

## ⚠️ Crash / Unexpected Reboot Diagnosis
```bash
# Check why last shutdown happened
journalctl -b -1 -n 50 --no-pager

# Look for OOM killer
journalctl -b -1 | grep -i "killed process"
dmesg | grep -i "oom"

# Check for kernel panics
journalctl -b -1 -p emerg..err

# Check last shutdown/reboot reason (systemd)
journalctl -b -1 -u systemd-logind
```

## 💡 Most Useful Single Command
```bash
journalctl -b -1 -n 50 --no-pager
```
👉 Shows the last 50 lines before the last reboot — usually where the answer is.
