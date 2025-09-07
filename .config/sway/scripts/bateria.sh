#!/bin/bash

STATUS=$(cat /sys/class/power_supply/BAT1/status)
CONFIG_PATH="/etc/supergfxd.conf"
TEMP_PATH="/tmp/supergfxd.conf"
SWAY_CONFIG="$HOME/.config/sway/config"

if [ "$STATUS" = "Discharging" ]; then
  # Na bateria: usar Integrated GPU e 60Hz
  swaymsg output eDP-1 resolution 1920x1080@60.000Hz position 1920 0

  CURRENT_MODE=$(jq -r '.mode' "$CONFIG_PATH")
  if [ "$CURRENT_MODE" != "Integrated" ]; then
    sudo jq '.mode = "Integrated"' "$CONFIG_PATH" > "$TEMP_PATH" && sudo mv "$TEMP_PATH" "$CONFIG_PATH"
    echo "[INFO] Trocando para modo Integrated. Requer reboot/logout."
  fi

  # Trocar terminal para foot
  sed -i 's/^set \$term .*/set $term foot/' "$SWAY_CONFIG"
  echo "[INFO] Terminal padrão alterado para foot no sway/config."

else
  # Na tomada: usar AsusMuxDgpu e 144Hz
  swaymsg output eDP-1 resolution 1920x1080@144.000Hz position 1920 0

  CURRENT_MODE=$(jq -r '.mode' "$CONFIG_PATH")
  if [ "$CURRENT_MODE" != "AsusMuxDgpu" ]; then
    sudo jq '.mode = "AsusMuxDgpu"' "$CONFIG_PATH" > "$TEMP_PATH" && sudo mv "$TEMP_PATH" "$CONFIG_PATH"
    echo "[INFO] Trocando para modo AsusMuxDgpu. Requer reboot/logout."
  fi

  # Trocar terminal para kitty
  sed -i 's/^set \$term .*/set $term kitty/' "$SWAY_CONFIG"
  echo "[INFO] Terminal padrão alterado para kitty no sway/config."
fi
