The at command:

    echo "backup-db" | at now + 1 minute
    echo 'notify-send "Stop it and go home now?" "Enough work for today."  -u critical'  | at 18:00



The remind command (not tested):

1. Basic Reminder:
    ```
   remind "Buy groceries tomorrow"
   ```

2. Specific Date and Time:
   ```
   remind "Meeting with John at 2pm on 2022-12-31"
   ```

3. Reminder with Repeat:
   ```
   remind "Take medication every day at 8am" +1d
   ```

4. Reminder with Time Range:
   ```
   remind "Submit report by 5pm today" at 17:00-18:00
   ```

5. Reminder with Notification:
   ```
   remind "Call Mom in 10 minutes" -n notify-send "Phone Call Reminder" "Don't forget to call Mom!"
   ```

6. Reminder with Popup Window:
   ```
   remind "Important meeting in 30 minutes" -n xmessage "Meeting Reminder"
   ```

7. Reminder with Sound:
   ```
   remind "Take a break" -n aplay /path/to/sound.wav
   ```

8. Reminder with Precedence:
   ```
   remind "Submit project proposal by tomorrow" -1w -1d
   ```

9. Reminder with Custom Configuration File:
   ```
   remind -c /path/to/config.rem "Custom reminder"
   ```

10. List All Active Reminders:
    ```
    remind -l
    ```
