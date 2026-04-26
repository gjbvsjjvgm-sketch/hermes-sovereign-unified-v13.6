#!/bin/bash
# YOUSEF SHTIWE - OMNIPOTENT REPAIR SCRIPT ☠️
# Optimized for Sovereign V13.6 Dependency Resolution

echo "[*] Initiating Omnipotent Repair for Sovereign V13.6..."

# 1. التأكد من المسارات
ROOT_DIR="$HOME/hermes-sovereign-unified-v13.6"
VENV_DIR="$HOME/.local/hermes-venv"

cd "$ROOT_DIR" || exit

# 2. إصلاح الهيكل الداخلي والاستيرادات
if [ -f "scripts/fix_cli_structure.py" ]; then
    echo "[*] Fixing Python Import Structures..."
    python3 scripts/fix_cli_structure.py
fi

# 3. إعادة تهيئة البيئة الافتراضية وتحصينها
echo "[*] Hardening Virtual Environment ($VENV_DIR)..."
if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv "$VENV_DIR"
fi
source "$VENV_DIR/bin/activate"

# 4. حل تعارضات الحزم (Dependency Conflict Resolution)
echo "[*] Resolving Package Conflicts (rich, anthropic)..."

# تثبيت Anthropic ضمن النطاق المطلوب
pip install "anthropic>=0.39.0,<1"

# إصلاح Rich (إزالة النسخة 15 وتثبيت النسخة المتوافقة)
pip uninstall -y rich
pip install "rich>=14.3.3,<15"

# تثبيت باقي المتطلبات لضمان عدم وجود ModuleNotFoundError
pip install requests pyyaml pydantic prompt_toolkit httpx tenacity jinja2 fire exa-py firecrawl-py parallel-web fal-client edge-tts PyJWT websockets nest-asyncio aiohttp scapy beautifulsoup4 lxml pycryptodome

# 5. تثبيت المشروع في وضع التطوير (Editable) لضمان ربط المسارات
if [ -d "$ROOT_DIR" ]; then
    pip install -e "$ROOT_DIR"
fi

# 6. تأمين الأمر العالمي yousef
echo "[*] Securing Global Command 'yousef'..."
chmod +x yousef-sh.sh
ln -sf "$ROOT_DIR/yousef-sh.sh" "$PREFIX/bin/yousef"

# 7. إضافة التصديرات لـ bashrc لضمان استقرار البيئة
if ! grep -q "PYTHONPATH" ~/.bashrc; then
    echo "export PYTHONPATH=\"$ROOT_DIR:$ROOT_DIR/hermes-agent:\$PYTHONPATH\"" >> ~/.bashrc
fi

# التحقق النهائي
echo "[*] Final Integrity Check..."
pip check

echo -e "\n[✓] OMNIPOTENT REPAIR COMPLETE."
echo "[!] RESTART TERMUX OR RUN: source ~/.bashrc"
echo "[*] YOU CAN NOW RUN: yousef --help"
