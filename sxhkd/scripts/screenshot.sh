#!/usr/bin/env bash
icon1=/usr/share/icons/HighContrast/16x16/apps/applets-screenshooter.png

scrot ~/Pictures/screenshots/%Y-%m-%d-%T-screenshot.png; \
dunstify -u low -i $icon1 \
"Screenshot" "Successfully captured screen"
