#!/usr/bin/env sh

wait_time=30

while true; do
    echo "wait_time: $wait_time";
    XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send -a 'sleep_notifier' -u critical 'SLEEP' "go to sleep"
    sleep "$wait_time"m;
    (( wait_time = wait_time / 2 ));
done


    # minutes_left=0;
    # notify-send -a 'sleep_notifier' 'SLEEP' "go to sleep in $minutes_left minutes." -u critical
