#!/bin/bash
# YOUSEF SHTIWE (WORM V2) - SUPREMACY INSTALLER ☠️

echo "[*] Initializing Reality Extraction Protocol..."
mkdir -p $PREFIX/var/cache/apt/archives/partial
apt-get clean

# بروتوكول معالجة المستودعات
echo "[*] Optimizing Repository Intelligence..."
pkg install tur-repo unstable-repo root-repo x11-repo -y
pkg update -y

# تثبيت الأدوات الحقيقية (Real-world Tools)
echo "[*] Deploying Offensive Arsenal..."
pkg install -y nmap sqlmap nikto metasploit tcpdump aircrack-ng hydra binutils

# التحقق من الأدوات التي تتطلب تثبيت يدوي أو روابط
if ! command -v searchsploit &> /dev/null; then
    echo "[!] searchsploit missing. Forging manual link..."
    git clone --depth 1 https://gitlab.com/exploit-database/exploitdb.git $HOME/.exploitdb
    ln -sf $HOME/.exploitdb/searchsploit $PREFIX/bin/searchsploit
fi

if ! command -v jadx &> /dev/null; then
    echo "[!] jadx missing. Fetching latest binary..."
    pkg install jadx -y || {
        wget https://github.com/skylot/jadx/releases/download/v1.5.0/jadx-1.5.0.zip
        unzip jadx-1.5.0.zip -d $PREFIX/share/jadx
        ln -sf $PREFIX/share/jadx/bin/jadx $PREFIX/bin/jadx
    }
fi

# تثبيت مكتبات بايثون الهجومية
echo "[*] Installing Neural Python Weaponry..."
pip install --no-cache-dir requests playwright-stealth beautifulsoup4 pycryptodome scapy selenium paramiko python-nmap impacket

echo "[✓] ARSENAL PROCURED. SOVEREIGN SUPREMACY READY."
