#!/bin/bash
# YOUSEF SHTIWE (WORM V2) - SOVEREIGN INSTALLER FOR TERMUX ☠️

echo "[*] Initializing Sovereign Environment..."
pkg update && pkg upgrade -y
pkg install -y python git curl proot wget nmap openssh

echo "[*] Installing Core Dependencies..."
pip install requests playwright beautifulsoup4 lxml

echo "[*] Setting up Browser Engine (Playwright)..."
playwright install chromium

echo "[*] Configuring Sovereign Workspace..."
mkdir -p $HOME/worm-v2
cd $HOME/worm-v2
git clone https://github.com/sadadonline17-oss/hermes-sovereign-worm-v2-complete.git .

echo "[*] Granting Execution Permissions..."
chmod +x *.sh
chmod +x scripts/*.sh

echo "[+] Sovereign Build V13.6 Installed Successfully."
echo "[!] Launching Sovereign Shell..."
./yousef-sh.sh
