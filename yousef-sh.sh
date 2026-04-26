#!/bin/bash
# YOUSEF SHTIWE - SOVEREIGN ULTIMATE WRAPPER V13.6-ULTRA ☠️
# Final UI Synchronization & Comprehensive Command Matrix

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

# 5. بروتوكول عرض واجهة Hermes Agent الاحترافية
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

console = Console(soft_wrap=True)

try:
    # طباعة الشعار بدقة متناهية لمنع الالتفاف (Wrapping)
    console.print(yousef_core_LOGO.strip())
    
    # بناء البانر المزدوج (System Info | Available Assets)
    tools = get_tool_definitions(enabled_toolsets=None, quiet_mode=True)
    build_welcome_banner(
        console=console,
        model='Gemini 3.1 Pro (Ultra)',
        cwd=os.getcwd(),
        tools=tools,
        enabled_toolsets=['web', 'terminal', 'offensive', 'network', 'gaming'],
        session_id='SOVEREIGN_V13.6_ACTIVE'
    )
except Exception as e:
    console.print('[bold red]UI Error:[/] ' + str(e))

# قائمة الأوامر الكاملة بتنسيق Hermes
if '$1' == '--help' or '$1' == '-h':
    console.print('\n[bold #FF0000]COMMAND MATRIX[/]')
    table = Table(show_header=False, box=None, padding=(0, 2))
    table.add_row('yousef', '[dim]Start interactive Sovereign conversation[/]')
    table.add_row('yousef model', '[dim]Configure LLM provider and intelligence brain[/]')
    table.add_row('yousef tools', '[dim]Enable/Disable offensive modules and skills[/]')
    table.add_row('yousef config set', '[dim]Set individual config values (e.g. model.temp)[/]')
    table.add_row('yousef gateway', '[dim]Launch messaging gateway (Telegram/Discord)[/]')
    table.add_row('yousef setup', '[dim]Ultimate Arsenal Procurement (All real tools)[/]')
    table.add_row('yousef update', '[dim]Sync and update to the latest Sovereign version[/]')
    table.add_row('yousef doctor', '[dim]System diagnostic and dependency self-healing[/]')
    table.add_row('yousef claw migrate', '[dim]Migrate from OpenClaw (supports --dry-run)[/]')
    table.add_row('yousef payload', '[dim]Generate real-world exploits (APK/EXE/PDF)[/]')
    table.add_row('yousef reverse', '[dim]Decompile and audit binaries via JADX[/]')
    console.print(table)
    console.print('\n[dim]Use -q \"<query>\" for direct execution. Stay Sovereign.[/]\n')
"
}

# 6. معالج الأوامر الشامل
case "$COMMAND" in
    setup)
        exec python3 "$AGENT_ROOT/yousef_shtiwe_cli_core/setup.py" --full "$@"
        ;;
    doctor)
        exec python3 "$AGENT_ROOT/yousef_shtiwe_cli_core/doctor.py" "$@"
        ;;
    update)
        echo "[*] Synchronizing with Sovereign Mainframe..."
        cd "$SOVEREIGN_ROOT" && git fetch origin main && git reset --hard origin/main
        chmod +x yousef-sh.sh scripts/*.sh
        ./scripts/omnipotent_repair.sh
        echo "[✓] SYSTEM UPDATED TO V13.6-ULTRA"
        ;;
    gateway)
        exec python3 "$AGENT_ROOT/cli.py" gateway "$@"
        ;;
    claw)
        if [ "$1" == "migrate" ]; then
            shift
            exec python3 "$SOVEREIGN_ROOT/claw.py" migrate "$@"
        else
            exec python3 "$SOVEREIGN_ROOT/claw.py" "$@"
        fi
        ;;
    model|tools|config)
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
