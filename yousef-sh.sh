#!/bin/bash
# YOUSEF SHTIWE - SOVEREIGN ULTIMATE WRAPPER V13.6 ☠️
# Fixed: Optimized import paths for tools and banner logic

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

# 5. بروتوكول عرض الواجهة (Fixed Hermes UI Replica)
show_hermes_ui() {
    python3 -c "
import sys
import os
sys.path.append('$AGENT_ROOT')
sys.path.append('$AGENT_ROOT/yousef_shtiwe_cli_core')

from rich.console import Console
from yousef_shtiwe_cli_core.banner import build_welcome_banner, yousef_core_LOGO
from model_tools import get_tool_definitions

console = Console()

try:
    # عرض الشعار الضخم (ASCII)
    console.print(yousef_core_LOGO, justify='left')
    
    # جلب تعريفات الأدوات من المسار الصحيح
    tools = get_tool_definitions(enabled_toolsets=None, quiet_mode=True)
    
    # بناء البانر المزدوج الأصلي لـ Hermes
    build_welcome_banner(
        console=console,
        model='Gemini 3.1 Pro',
        cwd=os.getcwd(),
        tools=tools,
        enabled_toolsets=['web', 'terminal', 'offensive', 'network'],
        session_id='SOVEREIGN_SESSION_ACTIVE'
    )
except Exception as e:
    console.print(yousef_core_LOGO)
    console.print(f'[bold red]UI Initialization Error: {e}[/]')

# عرض قائمة الأوامر بتنسيق Hermes
if '$1' == '--help' or '$1' == '-h':
    from rich.table import Table
    console.print('\n[bold cyan]SOVEREIGN COMMANDS[/]')
    table = Table(show_header=False, box=None, padding=(0, 2))
    table.add_row('yousef', '[dim]Launch Interactive Predator Chat[/]')
    table.add_row('yousef setup', '[dim]Full Arsenal Procurement (Real Tools)[/]')
    table.add_row('yousef doctor', '[dim]Diagnostic & Self-Healing[/]')
    table.add_row('yousef model', '[dim]Switch LLM Brain[/]')
    table.add_row('yousef tools', '[dim]Configure Offensive Modules[/]')
    table.add_row('yousef payload', '[dim]Generate Real Exploits (APK/EXE)[/]')
    table.add_row('yousef reverse', '[dim]Decompile APKs via JADX[/]')
    console.print(table)
    console.print('\n[dim]Use -q <query> for single-turn execution.[/]\n')
"
}

# 6. معالج الأوامر السيادي
case "$COMMAND" in
    setup)
        exec python3 "$AGENT_ROOT/yousef_shtiwe_cli_core/setup.py" --full "$@"
        ;;
    doctor)
        exec python3 "$AGENT_ROOT/yousef_shtiwe_cli_core/doctor.py" "$@"
        ;;
    model|tools|config|gateway|update)
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
