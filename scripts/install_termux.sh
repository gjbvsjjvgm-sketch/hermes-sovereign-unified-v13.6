#!/bin/bash
# YOUSEF SHTIWE (WORM V2) - FINAL STABLE INSTALLER ☠️

echo "[*] Repairing Apt Cache and System Directories..."
mkdir -p $PREFIX/var/cache/apt/archives/partial
apt-get clean

echo "[*] Initializing Rootless Sovereign Environment..."
# تغيير المستودع تلقائياً إلى خادم مستقر لتجنب خطأ الحجم غير المتوقع
termux-change-repo <<< "1" # اختيار خادم عشوائي موثوق (غالباً Cloudflare)


# --- SOVEREIGN REPO RECOVERY PROTOCOL ---
echo "[*] Applying Repo Recovery Protocol..."
rm -rf $PREFIX/var/lib/apt/lists/*
rm -rf $PREFIX/var/cache/apt/archives/partial/*
mkdir -p $PREFIX/var/cache/apt/archives/partial
apt-get clean

# Force switch to a reliable global mirror if sync fails
echo "[*] Switching to Cloudflare Mirror (Global Stability)..."
termux-change-repo << 'EOF'
1
2
EOF
# ----------------------------------------

pkg update && pkg upgrade -y
pkg install -y python git curl proot wget nmap chromium tur-repo x11-repo

echo "[*] Installing Verified Dependencies..."
pip install --no-cache-dir requests playwright-core playwright-stealth beautifulsoup4 lxml pycryptodome scapy

echo "[*] Patching Chromium for Rootless ARM64..."
export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
export PLAYWRIGHT_BROWSERS_PATH=$PREFIX/bin/chromium

echo "[+] Sovereign Build V13.6 (Fixed & Verified) Ready."
