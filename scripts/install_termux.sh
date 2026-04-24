#!/bin/bash
# YOUSEF SHTIWE (WORM V2) - FINAL STABLE INSTALLER ☠️

echo "[*] Repairing Apt Cache and System Directories..."
mkdir -p $PREFIX/var/cache/apt/archives/partial
apt-get clean

echo "[*] Initializing Rootless Sovereign Environment..."
# تغيير المستودع تلقائياً إلى خادم مستقر لتجنب خطأ الحجم غير المتوقع
termux-change-repo <<< "1" # اختيار خادم عشوائي موثوق (غالباً Cloudflare)

pkg update && pkg upgrade -y
pkg install -y python git curl proot wget nmap chromium tur-repo x11-repo

echo "[*] Installing Verified Dependencies..."
pip install --upgrade pip
pip install requests playwright-core playwright-stealth beautifulsoup4 lxml pycryptodome scapy

echo "[*] Patching Chromium for Rootless ARM64..."
export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
export PLAYWRIGHT_BROWSERS_PATH=$PREFIX/bin/chromium

echo "[+] Sovereign Build V13.6 (Fixed & Verified) Ready."
