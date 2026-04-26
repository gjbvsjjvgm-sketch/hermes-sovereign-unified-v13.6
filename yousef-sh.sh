#!/bin/bash
# YOUSEF SHTIWE - SOVEREIGN ULTIMATE WRAPPER V13.6 ☠️

# 1. إخماد كافة التحذيرات والضجيج البرمجي
export PYTHONWARNINGS="ignore"
export TIRITH_ENABLED="false"

# 2. تحديد المسارات المطلقة للكيان
export SOVEREIGN_ROOT="$HOME/hermes-sovereign-unified-v13.6"
export AGENT_ROOT="$SOVEREIGN_ROOT/hermes-agent"
export VENV_PATH="$HOME/.local/hermes-venv"

# 3. تفعيل البيئة الافتراضية المحصنة
if [ -d "$VENV_PATH" ]; then
    source "$VENV_PATH/bin/activate"
fi

# 4. حقن المسارات الهجومية في PYTHONPATH (تصحيح ModuleNotFound)
# نضيف مسار النواة ومسار المشروع لضمان عمل الاستيرادات النسبية والمطلقة
export PYTHONPATH="$SOVEREIGN_ROOT:$AGENT_ROOT:$AGENT_ROOT/yousef_shtiwe_cli_core:$PYTHONPATH"

# 5. معالج الأوامر السيادي
COMMAND=$1
shift

case "$COMMAND" in
    setup)
        exec python3 "$AGENT_ROOT/yousef_shtiwe_cli_core/setup.py" --full "$@"
        ;;
    doctor)
        exec python3 "$AGENT_ROOT/yousef_shtiwe_cli_core/doctor.py" "$@"
        ;;
    "claw")
        if [ "$1" == "migrate" ]; then
            shift
            exec python3 "$SOVEREIGN_ROOT/claw.py" migrate "$@"
        else
            exec python3 "$SOVEREIGN_ROOT/claw.py" "$@"
        fi
        ;;
    model|tools|config|gateway|update)
        exec python3 "$AGENT_ROOT/cli.py" "$COMMAND" "$@"
        ;;
    --help|-h)
        exec python3 "$AGENT_ROOT/cli.py" --help
        ;;
    *)
        if [ -z "$COMMAND" ]; then
            exec python3 "$AGENT_ROOT/cli.py"
        else
            exec python3 "$AGENT_ROOT/cli.py" "$COMMAND" "$@"
        fi
        ;;
esac
