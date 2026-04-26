#!/bin/bash
# YOUSEF SHTIWE - OMNIPOTENT REPAIR SCRIPT ☠️

echo "[*] Initiating Omnipotent Repair for Sovereign V13.6..."

# 1. التأكد من المسارات
ROOT_DIR="$HOME/hermes-sovereign-unified-v13.6"
VENV_DIR="$HOME/.local/hermes-venv"

cd "$ROOT_DIR" || exit

# 2. إصلاح الهيكل الداخلي والاستيرادات
echo "[*] Fixing Python Import Structures..."
python3 scripts/fix_cli_structure.py

# 3. إعادة تهيئة البيئة الافتراضية وتثبيت الحزم المفقودة
echo "[*] Hardening Virtual Environment ($VENV_DIR)..."
if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv "$VENV_DIR"
fi
source "$VENV_DIR/bin/activate"

# تثبيت كافة المتطلبات الأساسية لضمان عدم ظهور ModuleNotFoundError
pip install --upgrade pip
pip install requests pyyaml pydantic rich prompt_toolkit httpx tenacity jinja2 fire exa-py firecrawl-py parallel-web fal-client edge-tts PyJWT websockets nest-asyncio aiohttp scapy beautifulsoup4 lxml pycryptodome

# 4. تثبيت المشروع في وضع التطوير (Editable) إذا وجد setup.py
if [ -f "setup.py" ]; then
    pip install -e .
fi

# 5. تأمين الأمر العالمي yousef
echo "[*] Securing Global Command 'yousef'..."
chmod +x yousef-sh.sh
ln -sf "$ROOT_DIR/yousef-sh.sh" "$PREFIX/bin/yousef"

# 6. إضافة التصديرات لـ bashrc لضمان استقرار البيئة
if ! grep -q "PYTHONPATH" ~/.bashrc; then
    echo "export PYTHONPATH=\"$ROOT_DIR:$ROOT_DIR/hermes-agent:\$PYTHONPATH\"" >> ~/.bashrc
fi

echo -e "\n[✓] OMNIPOTENT REPAIR COMPLETE."
echo "[!] RESTART TERMUX OR RUN: source ~/.bashrc"
echo "[*] YOU CAN NOW RUN: yousef setup"
