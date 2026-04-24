#!/bin/bash
# YOUSEF SHTIWE (WORM V2) - TRUE SOVEREIGN INSTALLER ☠️

echo "[*] Initializing True Sovereign Environment..."
pkg update && pkg upgrade -y
pkg install -y python git curl proot wget nmap openssh chromium termux-api

# تثبيت مستودع الـ TUR للحصول على نسخة Chromium مستقرة
pkg install -y tur-repo
pkg install -y chromium

echo "[*] Installing Advanced Offensive Dependencies..."
pip install requests playwright playwright-stealth beautifulsoup4 lxml scapy pycryptodome

# إعداد محرك Playwright مع Chromium المثبت بالنظام
echo "[*] Configuring Playwright for Termux ARM64..."
export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
export PLAYWRIGHT_BROWSERS_PATH=$PREFIX/bin/chromium

echo "[*] Deploying Specialized Modules..."
# (المنطق هنا يفترض وجود المجلدات)

echo "[+] Sovereign Build V13.6 (Fixed) Installed Successfully."
