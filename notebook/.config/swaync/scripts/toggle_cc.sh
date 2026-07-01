#!/bin/bash

CONFIG_FILE="$HOME/.config/swaync/config.json"

if [ ! -f "$CONFIG_FILE" ]; then
    bash "$HOME/.config/swaync/scripts/expand.sh"
    swaync-client -o   # abre o control center
    exit 0
fi

if grep -q '"positionX": "center"' "$CONFIG_FILE"; then
    # Está EXPANDIDO -> ir para COLLAPSED e esconder swaync
    swaync-client -cp   # esconde/fecha control center (ou use -t se for toggle)
    bash "$HOME/.config/swaync/scripts/collapse.sh"
else
    # Está COLLAPSED -> ir para EXPANDED e abrir swaync
    bash "$HOME/.config/swaync/scripts/expand.sh"
    swaync-client -op   # abre control center
fi

