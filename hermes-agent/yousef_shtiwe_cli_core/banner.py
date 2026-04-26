from yousef_shtiwe_cli_core import __version__ as VERSION, __release_date__ as RELEASE_DATE
import json, logging, shutil, subprocess, threading, time, os
from pathlib import Path
from typing import Dict, List, Optional
from rich.console import Console
from rich.panel import Panel
from rich.table import Table

# ASCII ART - WORM V2 SUPREME DESIGN
YOUSEF_ASCII = r"""[bold #FF0000]
██╗   ██╗ ██████╗ ██╗   ██╗███████╗███████╗
╚██╗ ██╔╝██╔═══██╗██║   ██║██╔════╝██╔════╝
 ╚████╔╝ ██║   ██║██║   ██║███████╗█████╗  
  ╚██╔╝  ██║   ██║██║   ██║╚════██║██╔══╝  
   ██║   ╚██████╔╝╚██████╔╝███████║███████╗
   ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝[/]"""

SHTIWE_ASCII = r"""[bold #8B0000]
  ░██████╗██╗  ██╗████████╗██╗██╗    ██╗███████╗
  ██╔════╝██║  ██║╚══██╔══╝██║██║    ██║██╔════╝
  ╚█████╗ ███████║   ██║   ██║██║ █╗ ██║█████╗  
   ╚═══██╗██╔══██║   ██║   ██║██║███╗██║██╔══╝  
  ██████╔╝██║  ██║   ██║   ██║╚███╔███╔╝███████╗
  ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚══╝╚══╝ ╚══════╝[/]"""

YOUSEF_SHTIWE_BANNER = YOUSEF_ASCII + "\n" + SHTIWE_ASCII + "\n[dim #555553]  [ SYSTEM COMPROMISED : YOUSEF SHTIWE SOVEREIGN WORM V2 ][/]"
yousef_core_LOGO = YOUSEF_SHTIWE_BANNER

def build_welcome_banner(console, model, cwd, tools, enabled_toolsets, session_id=None, context_length=None):
    layout_table = Table.grid(expand=True)
    layout_table.add_column(ratio=1)
    layout_table.add_column(ratio=1)
    
    left_lines = [
        f"[bold #FF0000]PREDATOR | SOVEREIGN CORE ACTIVE[/]",
        f"[bold cyan]{model}[/] [dim]· V13.6-SUPREME[/]",
        f"[dim]{cwd}[/]"
    ]
    if session_id: left_lines.append(f"[dim yellow]Session: {session_id}[/]")
    
    right_lines = [f"[bold #FF0000]OFFENSIVE ARSENAL[/]"]
    right_lines.append(f"[dim]Total Tools: {len(tools)} | Mode: Absolute[/]")
    
    layout_table.add_row("\n".join(left_lines), "\n".join(right_lines))
    
    console.print("\n", yousef_core_LOGO, "\n")
    console.print(Panel(layout_table, border_style="#FF0000", title="[bold #BF00FF]STATUS MATRIX[/]"))

