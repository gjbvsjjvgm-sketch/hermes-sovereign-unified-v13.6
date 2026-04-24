# -*- coding: utf-8 -*-
import sys
import os
import subprocess
import time
from rich.console import Console
from rich.panel import Panel
from rich.text import Text

console = Console()

def display_banner():
    banner = """
    ▄████▄   ▒█████   ██▒   █▓▓█████  ██▀███  ▓█████  ██▓  ▄████  ███▄    █     
   ▒██▀ ▀█  ▒██▒  ██▒▓██░   █▒▓█   ▀ ▓██ ▒ ██▒▓█   ▀ ▓██▒ ██▒ ▀█▒ ██ ▀█   █     
   ▒▓█    ▄ ▒██░  ██▒ ▓██  █▒░▒███   ▓██ ░▄█ ▒▒███   ▒██░▒██░▄▄▄░▓██  ▀█ ██▒    
   ▒▓▓▄ ▄██▒▒██   ██░  ▒██ █░░▒▓█  ▄ ▒██▀▀█▄  ▒▓█  ▄ ▒██░░▓█  ██▓▓██▒  ▐▌██▒    
   ▒ ▓███▀ ░░ ████▓▒░   ▒▀█░  ░▒████▒░██▓ ▒██▒░▒████▒░██░░▒▓███▀▒▒██░   ▓██░    
    """
    console.print(Text(banner, style="bold #BF00FF"))
    console.print(Panel("[bold #00FF00] YOUSEF SHTIWE - SOVEREIGN SUPREMACY V11.2 [/]", border_style="#00FF00", subtitle="[REALITY: ABSOLUTE]", subtitle_align="right"))
    console.print("[bold #BF00FF]PREDATOR STATUS: ACTIVE | REALITY: ABSOLUTE[/]\n")

def run_full_arsenal_install():
    display_banner()
    console.print(Panel("[bold #00FF00] INITIATING TOTAL ARSENAL PROCUREMENT V11.2 [/]", border_style="#00FF00"))
    
    is_termux = os.path.exists("/data/data/com.termux")
    
    # 1. Python Procurement (User-space)
    console.print("[*] Hardening Neural Intelligence Layer (User-space)...")
    subprocess.run([sys.executable, "-m", "pip", "install", "--user", "--upgrade", "pip"], check=False)
    python_deps = ["requests", "pyyaml", "pydantic", "rich", "prompt_toolkit", "httpx", "tenacity", "jinja2", "fire", "exa-py", "firecrawl-py", "parallel-web", "fal-client", "edge-tts", "PyJWT", "websockets", "nest-asyncio", "aiohttp", "ghunt"]
    subprocess.run([sys.executable, "-m", "pip", "install", "--user"] + python_deps, check=False)
    
    # 2. Binary Procurement (Self-healing logic)
    if is_termux:
        console.print("[*] Termux detected. Procuring Binaries via pkg...")
        subprocess.run(["pkg", "install", "nmap", "sqlmap", "nikto", "exploitdb", "argus", "argus-clients", "-y"], check=False)
    else:
        console.print("[!] Standard Linux detected. Checking for pre-installed binaries...")
        binaries = ["nmap", "sqlmap", "nikto", "searchsploit", "argus"]
        for b in binaries:
            if subprocess.run(["which", b], capture_output=True).returncode != 0:
                console.print(f"[bold yellow][!] {b} missing. Manual installation required as non-root.[/]")
            else:
                console.print(f"[bold green][✓] {b} verified.[/]")

    console.print("[bold green][✓] ARSENAL PROCUREMENT COMPLETE.[/]")

def launch_core(subcommand=None, extra_args=None):
    try:
        if subcommand:
            sys.argv = [sys.argv[0], subcommand] + (extra_args if extra_args else [])
        else:
            sys.argv = [sys.argv[0], "chat"]
        
        # Adjust PYTHONPATH for internal core
        SOVEREIGN_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
        sys.path.insert(0, os.path.join(SOVEREIGN_ROOT, "hermes-agent"))
        
        from yousef_shtiwe_cli_core.main import main as core_main
        sys.argv[0] = "yousef"
        core_main()
    except Exception as e:
        console.print(f"[bold red][!] Sovereign Core Error: {e}[/]")
        sys.exit(1)

def main():
    if len(sys.argv) < 2:
        display_banner()
        launch_core("chat")
        return
    cmd = sys.argv[1].lower()
    if cmd in ["full-install", "fix", "setup"]:
        run_full_arsenal_install()
        return
    if cmd == "status":
        display_banner()
        launch_core("status")
        return
    launch_core(cmd, sys.argv[2:])

if __name__ == "__main__":
    main()
