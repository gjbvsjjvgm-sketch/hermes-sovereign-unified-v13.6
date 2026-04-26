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

# 4. حقن المسارات الهجومية في PYTHONPATH
export PYTHONPATH="$SOVEREIGN_ROOT:$AGENT_ROOT:$AGENT_ROOT/yousef_shtiwe_cli_core:$PYTHONPATH"

COMMAND=$1
shift

# 5. منطق عرض الواجهة الفخمة عند طلب المساعدة أو التشغيل الافتراضي
if [ "$COMMAND" == "--help" ] || [ "$COMMAND" == "-h" ] || [ -z "$COMMAND" ]; then
    # استدعاء عرض البانر من النواة مباشرة قبل عرض المساعدة
    python3 -c "
import sys
import os
sys.path.append('$AGENT_ROOT')
sys.path.append('$AGENT_ROOT/yousef_shtiwe_cli_core')
from rich.console import Console
from yousef_shtiwe_cli_core.banner import build_welcome_banner, yousef_core_LOGO
console = Console()
console.print(yousef_core_LOGO, justify='left')
# عرض معلومات مختصرة تحاكي واجهة Hermes Agent الأصلية
console.print(f'[bold #FF4500]YOUSEF SHTIWE SOVEREIGN CORE[/] | [dim]Status: PREDATOR ACTIVE[/]')
console.print('[dim]----------------------------------------------------------------------[/]')
"
fi

# 6. معالج الأوامر السيادي
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
