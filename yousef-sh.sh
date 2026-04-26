#!/bin/bash
# YOUSEF SHTIWE - SOVEREIGN UNIVERSAL WRAPPER V13.6 ☠️

# 1. تحديد المسارات الأساسية
export SOVEREIGN_ROOT="$HOME/hermes-sovereign-unified-v13.6"
export AGENT_ROOT="$SOVEREIGN_ROOT/hermes-agent"
export VENV_PATH="$HOME/.local/hermes-venv"

# 2. تفعيل البيئة الافتراضية تلقائياً
if [ -d "$VENV_PATH" ]; then
    source "$VENV_PATH/bin/activate"
else
    echo "[!] Virtual Environment missing at $VENV_PATH. Run 'yousef setup' first."
fi

# 3. إصلاح PYTHONPATH بشكل قاطع وشامل
# نضيف جذور المشروع والمجلدات الفرعية لضمان عمل الاستيرادات
export PYTHONPATH="$SOVEREIGN_ROOT:$AGENT_ROOT:$AGENT_ROOT/yousef_shtiwe_cli_core:$PYTHONPATH"

# 4. معالج الأوامر الذكي
COMMAND=$1
shift # إزالة المعامل الأول لترك الباقي للسكربتات

case "$COMMAND" in
    setup)
        echo "[*] Launching Sovereign Setup Wizard..."
        exec python3 "$AGENT_ROOT/yousef_shtiwe_cli_core/setup.py" --full "$@"
        ;;
    doctor)
        echo "[*] Running Sovereign Diagnostic (Doctor)..."
        exec python3 "$AGENT_ROOT/yousef_shtiwe_cli_core/doctor.py" "$@"
        ;;
    "claw")
        # معالجة migrate بشكل خاص
        if [ "$1" == "migrate" ]; then
            shift
            exec python3 "$SOVEREIGN_ROOT/claw.py" migrate "$@"
        else
            exec python3 "$SOVEREIGN_ROOT/claw.py" "$@"
        fi
        ;;
    model|tools|config|gateway|update)
        # توجيه الأوامر المباشرة إلى cli.py أو الموديولات المناسبة
        exec python3 "$AGENT_ROOT/cli.py" "$COMMAND" "$@"
        ;;
    *)
        # إذا لم يكن أمراً معروفاً، قم بتشغيل الـ CLI التفاعلي الافتراضي
        if [ -z "$COMMAND" ]; then
            exec python3 "$AGENT_ROOT/cli.py"
        else
            exec python3 "$AGENT_ROOT/cli.py" "$COMMAND" "$@"
        fi
        ;;
esac
