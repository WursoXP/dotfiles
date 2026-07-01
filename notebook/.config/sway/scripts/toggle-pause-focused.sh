#!/bin/bash

# Obtém o PID da janela atualmente em foco
PID=$(swaymsg -t get_tree | jq '.. | select(.focused? == true) | .pid')

# Verifica se conseguiu um PID
if [ -z "$PID" ]; then
    notify-send "❌ Nenhuma janela focada com PID encontrado"
    exit 1
fi

# Verifica o estado atual do processo
STATUS=$(ps -o state= -p "$PID" | awk '{print $1}')

if [ "$STATUS" = "T" ]; then
    kill -CONT "$PID"
    notify-send "▶️ Processo retomado (PID $PID)"
else
    kill -STOP "$PID"
    notify-send "⏸️ Processo pausado (PID $PID)"
fi

