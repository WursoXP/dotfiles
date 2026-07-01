#!/bin/bash

STATUS=$(cat /sys/class/power_supply/BAT1/status)
SWAY_CONFIG="$HOME/.config/sway/config"

if [ "$STATUS" = "Discharging" ]; then
  # Na bateria: usar Integrated GPU e 60Hz
  swaymsg output eDP-1 resolution 1920x1080@60.000Hz position 1920 0

  # Mudar modo da GPU
  supergfxctl --mode Integrated

  # Desempenho
  powerprofilesctl set power-saver

  echo "[INFO] Trocando para modo Integrated via supergfxctl."

  # Trocar terminal para foot
  sed -i 's/^set \$term .*/set $term foot/' "$SWAY_CONFIG"
  echo "[INFO] Terminal padrão alterado para foot no sway/config."

else
  # Na tomada: usar AsusMuxDgpu e 144Hz
  swaymsg output eDP-1 resolution 1920x1080@144.000Hz position 1920 0

  # Mudar modo da GPU
  supergfxctl --mode AsusMuxDgpu

  # Desempenho
  powerprofilesctl set performance
  
  echo "[INFO] Trocando para modo AsusMuxDgpu via supergfxctl."

  # Trocar terminal para kitty
  sed -i 's/^set \$term .*/set $term kitty/' "$SWAY_CONFIG"
  echo "[INFO] Terminal padrão alterado para kitty no sway/config."
fi

