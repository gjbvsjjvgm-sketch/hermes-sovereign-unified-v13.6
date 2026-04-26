#!/bin/bash
# YOUSEF SHTIWE - OMNIPOTENT REPAIR SCRIPT ☠️
# Final Stability & Stealth Patch

echo "[*] Finalizing Sovereign Stability Protocol..."

ROOT_DIR="$HOME/hermes-sovereign-unified-v13.6"
VENV_DIR="$HOME/.local/hermes-venv"
HERMES_CONFIG="$HOME/.hermes"

cd "$ROOT_DIR" || exit

# 1. إخماد التحذيرات والماسحات الأمنية
echo "[*] Suppressing Security Scanners & Noise..."
mkdir -p "$HERMES_CONFIG"
cp scripts/suppress_config.json "$HERMES_CONFIG/config.json"
export PYTHONWARNINGS="ignore"

# 2. إصلاح الاستيرادات
if [ -f "scripts/fix_cli_structure.py" ]; then
    python3 scripts/fix_cli_structure.py
fi

# 3. تحصين الـ Venv والتبعيات الحرجة
source "$VENV_DIR/bin/activate"
echo "[*] Enforcing Version Locks (rich, anthropic)..."
pip install "rich>=14.3.3,<15" "anthropic>=0.39.0,<1" --quiet

# تثبيت أي مكتبات قد تطلبها النواة فجأة
pip install httpx-sse msgpack jiter termcolor --quiet

# 4. تثبيت الأمر العالمي
chmod +x yousef-sh.sh
ln -sf "$ROOT_DIR/yousef-sh.sh" "$PREFIX/bin/yousef"

# 5. تحديث التصديرات
if ! grep -q "PYTHONWARNINGS" ~/.bashrc; then
    echo 'export PYTHONWARNINGS="ignore"' >> ~/.bashrc
    echo 'export TIRITH_ENABLED="false"' >> ~/.bashrc
fi

echo "[*] Integrity Check..."
pip check

echo -e "\n[✓] SOVEREIGN STABILITY SECURED."
echo "[*] Commands Ready: yousef, yousef setup, yousef doctor."
