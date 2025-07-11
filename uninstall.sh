#!/bin/bash

set -e

NVIM_CONFIG_DIR="$HOME/.config/nvim"
BACKUP_DIR="$NVIM_CONFIG_DIR.bak"

echo "[*] Uninstalling nvim-config..."

if [ -L "$NVIM_CONFIG_DIR" ]; then
    echo "[!] Removing symlink at $NVIM_CONFIG_DIR"
    rm "$NVIM_CONFIG_DIR"
else
    echo "[!] No symlink found at $NVIM_CONFIG_DIR — skipping"
fi

if [ -d "$BACKUP_DIR" ]; then
    echo "[!] Restoring backup from $BACKUP_DIR"
    mv "$BACKUP_DIR" "$NVIM_CONFIG_DIR"
    echo "[✓] Backup restored."
else
    echo "[i] No backup found. Nothing to restore."
fi

echo "[✓] Uninstall complete."

