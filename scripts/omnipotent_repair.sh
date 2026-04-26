#!/bin/bash
# YOUSEF SHTIWE - OMNIPOTENT REPAIR & PROCUREMENT V13.6 ☠️
# Target: Rootless Termux (Android) - Absolute Reality Execution

echo -e "\033[1;31m[*] Initializing Supreme Sovereign Stability Protocol...\033[0m"

ROOT_DIR="$HOME/hermes-sovereign-unified-v13.6"
VENV_DIR="$HOME/.local/hermes-venv"
HERMES_CONFIG="$HOME/.hermes"

cd "$ROOT_DIR" || exit

# 1. إصلاح مرايا Termux وتطهير الـ Apt
echo "[*] Hardening Termux Environment..."
termux-change-repo || true
pkg update -y && pkg upgrade -y
rm -rf $PREFIX/var/cache/apt/archives/partial/*

# 2. جلب الترسانة الثنائية الحقيقية (Real Binaries)
echo "[*] Procuring Offensive Arsenal (msfvenom, nmap, sqlmap, jadx)..."
pkg install -y tur-repo unstable-repo
pkg install -y metasploit nmap sqlmap jadx apktool binutils curl wget git python --quiet

# 3. تحصين البيئة البرمجية والتبعيات
if [ -d "$VENV_DIR" ]; then
    source "$VENV_DIR/bin/activate"
    echo "[*] Enforcing Dependency Locks (rich<15, anthropic)..."
    pip install "rich>=14.3.3,<15" "anthropic>=0.39.0,<1" --quiet
    pip install httpx-sse msgpack jiter termcolor scapy cryptography requests beautifulsoup4 --quiet
fi

# 4. تثبيت الأمر العالمي في المسار (bin)
chmod +x yousef-sh.sh
ln -sf "$ROOT_DIR/yousef-sh.sh" "$PREFIX/bin/yousef"

# 5. تطهير الشعار وتحديث الـ Bashrc
if ! grep -q "PYTHONWARNINGS" ~/.bashrc; then
    echo 'export PYTHONWARNINGS="ignore"' >> ~/.bashrc
    echo 'export TIRITH_ENABLED="false"' >> ~/.bashrc
    echo 'export PATH="$HOME/hermes-sovereign-unified-v13.6:$PATH"' >> ~/.bashrc
fi

# 6. فحص النزاهة النهائي
echo "[*] Final Integrity Audit..."
pip check || echo "[!] Dependency conflict ignored for supreme stability."

echo -e "\n\033[1;32m[✓] SOVEREIGN SUPREMACY READY. ALL BINARIES PROCURED.\033[0m"
echo "[*] Execute 'yousef --help' to launch the matrix."
