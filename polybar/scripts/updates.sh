#!/usr/bin/env bash

bell_icon=/usr/local/share/fonts/otf/fontawesome-pro-5.13.0-desktop/svgs/solid/bell-on.svg
alarm_icon=/usr/local/share/fonts/otf/fontawesome-pro-5.13.0-desktop/svgs/solid/alarm-exclamation.svg
warn_icon=/usr/local/share/fonts/otf/fontawesome-pro-5.13.0-desktop/svgs/solid/exclamation-triangle.svg

get_total_updates() { updates=$(checkupdates 2>/dev/null | wc -l); }

while true; do
    get_total_updates

    # notify user of updates
    if hash notify-send &>/dev/null; then
        if (( updates > 50 )); then
            dunstify -u critical -i $warn_icon \
                "Pacman" "You really need to update!! \
		 \n$updates New packages"
        elif (( updates > 25 )); then
            dunstify -u normal -i $alarm_icon \
                "Pacman" "You should update soon \
	       	\n$updates New packages"
        elif (( updates > 2 )); then
            dunstify -u low -i $bell_icon \
                "Pacman" "$updates New packages"
        fi
    fi

    # when there are updates available
    # every 10 seconds another check for updates is done
    while (( updates > 0 )); do
        if (( updates == 1 )); then
            echo " $updates"
        elif (( updates > 1 )); then
            echo " $updates"
        else
	    echo " " #None
        fi
        sleep 10
        get_total_updates
    done

    # when no updates are available, use a longer loop, this saves on CPU
    # and network uptime, only checking once every 30 min for new updates
    while (( updates == 0 )); do
        echo " " #None
        sleep 1800
        get_total_updates
    done
done
