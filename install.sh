#!/usr/bin/env bash
set -euo pipefail

echo "[*] Setting up Neovim config..."

CONFIG_DIR="$HOME/.config/nvim"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$CONFIG_DIR" == "$REPO_DIR" ]]; then
    echo "Already done."
    exit 0
fi

if [ -e "$CONFIG_DIR" ]; then
    echo "[!] Backing up existing config to ${CONFIG_DIR}.bak"
    mv "$CONFIG_DIR" "${CONFIG_DIR}.bak"
fi

mkdir -p "$(dirname "$CONFIG_DIR")"
ln -sfn "$REPO_DIR" "$CONFIG_DIR"

echo "[✓] Symlink created: $CONFIG_DIR → $REPO_DIR"
echo "Neovim instalation completed."

