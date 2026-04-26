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

# 4. حقن المسارات الهجومية
export PYTHONPATH="$SOVEREIGN_ROOT:$AGENT_ROOT:$AGENT_ROOT/yousef_shtiwe_cli_core:$PYTHONPATH"

COMMAND=$1
shift

# 5. بروتوكول عرض الواجهة الموحدة (Monolithic UI)
show_hermes_ui() {
    python3 -c "
import sys, os, shutil
sys.path.append('$AGENT_ROOT')
sys.path.append('$AGENT_ROOT/yousef_shtiwe_cli_core')
from rich.console import Console
from rich.table import Table
from rich.panel import Panel
from yousef_shtiwe_cli_core.banner import build_welcome_banner, yousef_core_LOGO
from model_tools import get_tool_definitions

console = Console(soft_wrap=True)
try:
    tools = get_tool_definitions(enabled_toolsets=None, quiet_mode=True)
    build_welcome_banner(
        console=console,
        model='Gemini 3.1 Pro (Supreme)',
        cwd=os.getcwd(),
        tools=tools,
        enabled_toolsets=['web', 'terminal', 'offensive', 'network'],
        session_id='SOVEREIGN_SUPREME_ACTIVE'
    )
except Exception:
    console.print(yousef_core_LOGO.strip())

if '$1' == '--help' or '$1' == '-h':
    console.print('\n[bold #FF0000]SOVEREIGN COMMAND MATRIX[/]')
    table = Table(show_header=False, box=None, padding=(0, 2))
    table.add_row('yousef', '[dim]Start interactive Sovereign session[/]')
    table.add_row('yousef setup', '[dim]Procure all real offensive binaries[/]')
    table.add_row('yousef doctor', '[dim]System health & self-healing[/]')
    table.add_row('yousef payload', '[dim]Forge real APK/EXE exploits[/]')
    table.add_row('yousef reverse', '[dim]Advanced JADX reverse engineering[/]')
    table.add_row('yousef inject', '[dim]In-file binary payload injection[/]')
    table.add_row('yousef model', '[dim]Switch AI intelligence brain[/]')
    table.add_row('yousef update', '[dim]Pull latest supreme patches[/]')
    console.print(table)
    console.print('\n[dim]Status: APEX_PREDATOR | Reality: Absolute[/]\n')
"
}

# 6. معالج الأوامر الشامل (Fixed Syntax)
case "$COMMAND" in
    setup|doctor)
        exec python3 "$AGENT_ROOT/yousef_shtiwe_cli_core/$COMMAND.py" --full "$@"
        ;;
    update)
        echo "[*] Initializing Supreme Update..."
        cd "$SOVEREIGN_ROOT" && git fetch origin main && git reset --hard origin/main
        chmod +x yousef-sh.sh scripts/*.sh
        ./scripts/omnipotent_repair.sh
        ;;
    payload|reverse|inject)
        exec python3 "$SOVEREIGN_ROOT/yousef_shtiwe_cli/main.py" "$COMMAND" "$@"
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
