#!/usr/bin/env sh

echo "Enter password to create a backup"
sudo timeshift --create

echo "Pacman doing its job..."
sudo pacman -Syu

echo "Upgrade complete. Press any key to continue..."
read -r
