#!/bin/bash
# YOUSEF SHTIWE (WORM V2) - ROOTLESS SOVEREIGN INSTALLER ☠️

echo "[*] Initializing Rootless Sovereign Environment..."
pkg update && pkg upgrade -y
pkg install -y python git curl proot wget nmap openssh tur-repo x11-repo

# تثبيت Chromium من مستودعات Termux الرسمية (متوافق مع ARM64)
pkg install -y chromium

echo "[*] Installing Rootless Offensive Dependencies..."
# استخدام playwright-core لتجنب تحميل المتصفحات غير المتوافقة
pip install requests playwright-core playwright-stealth beautifulsoup4 lxml pycryptodome

# ملاحظة: Scapy سيعمل في وضع التحليل فقط (Offline/Stream) بدون Root
pip install scapy

echo "[*] Patching Environment for Android 12+ (Phantom Process Fix)..."
echo "Note: If app crashes, run this via ADB: adb shell \"/system/bin/device_config put activity_manager max_phantom_processes 2147483647\""

echo "[+] Sovereign Build V13.6 (Rootless Optimized) Installed Successfully."
