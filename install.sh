#!/bin/bash

set -e 

echo "[*] Setting up Neovim config..."

NVIM_CONFIG_DIR="$HOME/.config/nvim"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -e "$NVIM_CONFIG_DIR" ]; then
    echo "[!] Backing up existing config to ${NVIM_CONFIG_DIR}.bak"
    mv "$NVIM_CONFIG_DIR" "${NVIM_CONFIG_DIR}.bak"
fi

mkdir -p "$(dirname "$NVIM_CONFIG_DIR")"
ln -sfn "$REPO_DIR" "$NVIM_CONFIG_DIR"

echo "[✓] Symlink created: $NVIM_CONFIG_DIR → $REPO_DIR"
echo "Now open Neovim and enjoy your rice ✨"

