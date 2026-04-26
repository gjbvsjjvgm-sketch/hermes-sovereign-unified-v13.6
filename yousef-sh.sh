#!/bin/bash
# YOUSEF SHTIWE - SOVEREIGN ULTIMATE WRAPPER V13.6-ULTRA-SUPREME ☠️

# 1. إخماد الضجيج البرمجي
export PYTHONWARNINGS="ignore"
export TIRITH_ENABLED="false"

# 2. المسارات المطلقة
export SOVEREIGN_ROOT="$HOME/hermes-sovereign-unified-v13.6"
export AGENT_ROOT="$SOVEREIGN_ROOT/hermes-agent"
export VENV_PATH="$HOME/.local/hermes-venv"

# 3. تفعيل البيئة المحصنة
if [ -d "$VENV_PATH" ]; then
    source "$VENV_PATH/bin/activate"
fi

# 4. حقن المسارات
export PYTHONPATH="$SOVEREIGN_ROOT:$AGENT_ROOT:$AGENT_ROOT/yousef_shtiwe_cli_core:$PYTHONPATH"

COMMAND=$1
shift

# 5. بروتوكول عرض واجهة Hermes Agent (إصلاح تكرار الشعار والالتفاف)
show_hermes_ui() {
    python3 -c "
import sys
import os
sys.path.append('$AGENT_ROOT')
sys.path.append('$AGENT_ROOT/yousef_shtiwe_cli_core')

from rich.console import Console
from rich.table import Table
from yousef_shtiwe_cli_core.banner import build_welcome_banner, yousef_core_LOGO
from model_tools import get_tool_definitions

console = Console(width=shutil.get_terminal_size().columns, soft_wrap=True) if 'shutil' in dir() else Console(soft_wrap=True)
import shutil

try:
    # طباعة الشعار لمرة واحدة فقط وبدون تكرار
    logo = yousef_core_LOGO.strip()
    console.print(logo)
    
    # جلب الأدوات وبناء البانر المزدوج
    tools = get_tool_definitions(enabled_toolsets=None, quiet_mode=True)
    build_welcome_banner(
        console=console,
        model='Gemini 3.1 Pro (Supreme)',
        cwd=os.getcwd(),
        tools=tools,
        enabled_toolsets=['web', 'terminal', 'offensive', 'network', 'gaming'],
        session_id='SOVEREIGN_SUPREME_ACTIVE'
    )
except Exception as e:
    pass

# عرض قائمة الأوامر الكاملة والحقيقية
if '$1' == '--help' or '$1' == '-h':
    console.print('\n[bold #FF0000]SOVEREIGN COMMAND MATRIX[/]')
    table = Table(show_header=False, box=None, padding=(0, 2))
    table.add_row('yousef', '[dim]Start interactive Sovereign chat session[/]')
    table.add_row('yousef model', '[dim]Choose your LLM provider and model brain[/]')
    table.add_row('yousef tools', '[dim]Configure and enable/disable attack modules[/]')
    table.add_row('yousef config set', '[dim]Set individual configuration values[/]')
    table.add_row('yousef gateway', '[dim]Start messaging gateway (Telegram/Discord)[/]')
    table.add_row('yousef setup', '[dim]Full Arsenal Procurement (Procures all binaries)[/]')
    table.add_row('yousef update', '[dim]Update Sovereign to the latest supreme version[/]')
    table.add_row('yousef doctor', '[dim]Self-healing and diagnostic utility[/]')
    table.add_row('yousef claw migrate', '[dim]Interactive migration from OpenClaw[/]')
    table.add_row('yousef payload', '[dim]Generate real-world exploits (android/windows)[/]')
    table.add_row('yousef reverse', '[dim]Real reverse engineering using JADX/APKtool[/]')
    table.add_row('yousef inject', '[dim]Inject payloads into real PDF/Images[/]')
    console.print(table)
    console.print('\n[dim]Status: PREDATOR | REALITY: ABSOLUTE[/]\n')
"
}

# 6. معالج الأوامر الشامل (توجيه الأوامر لمصادرها الحقيقية)
case "$COMMAND" in
    setup)
        exec python3 "$AGENT_ROOT/yousef_shtiwe_cli_core/setup.py" --full "$@"
        ;;
    doctor)
        exec python3 "$AGENT_ROOT/yousef_shtiwe_cli_core/doctor.py" "$@"
        ;;
    update)
        echo "[*] Syncing with Supreme Mainframe..."
        cd "$SOVEREIGN_ROOT" && git fetch origin main && git reset --hard origin/main
        chmod +x yousef-sh.sh scripts/*.sh
        ./scripts/omnipotent_repair.sh
        echo "[✓] SYSTEM UPDATED TO V13.6-SUPREME"
        ;;
    payload)
        exec python3 "$SOVEREIGN_ROOT/yousef_shtiwe_cli/main.py" payload "$@"
        ;;
    reverse)
        exec python3 "$SOVEREIGN_ROOT/yousef_shtiwe_cli/main.py" reverse "$@"
        ;;
    inject)
        exec python3 "$SOVEREIGN_ROOT/yousef_shtiwe_cli/main.py" inject "$@"
        ;;
    claw)
        if [ "$1" == "migrate" ]; then
            shift
            exec python3 "$SOVEREIGN_ROOT/claw.py" migrate "$@"
        else
            exec python3 "$SOVEREIGN_ROOT/claw.py" "$@"
        fi
        ;;
    model|tools|config|gateway)
        exec python3 "$AGENT_ROOT/cli.py" "$COMMAND" "$@"
        ;;
    --help|-h)
        show_hermes_ui "--help"
        exit 0
        ;;
    *)
        if [ -z "$COMMAND" ]; then
            exec python3 "$AGENT_ROOT/cli.py"
        else
            exec python3 "$AGENT_ROOT/cli.py" "$COMMAND" "$@"
        fi
        ;;
esac
