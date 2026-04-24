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
    console.print(Panel("[bold #00FF00] YOUSEF SHTIWE - SOVEREIGN SUPREMACY V13.6 [/]", border_style="#00FF00", subtitle="[REALITY: ABSOLUTE]", subtitle_align="right"))

def run_total_annihilation_install():
    display_banner()
    console.print(Panel("[bold red] INITIATING TOTAL ARSENAL ANNIHILATION INSTALL [/]", border_style="red"))
    
    is_termux = os.path.exists("/data/data/com.termux")
    
    # 1. Repo Setup
    if is_termux:
        console.print("[*] Configuring High-Security Repositories (TUR, Unstable, X11)...")
        subprocess.run(["pkg", "install", "tur-repo", "unstable-repo", "x11-repo", "root-repo", "-y"], check=False)
        subprocess.run(["pkg", "update", "-y"], check=False)

    # 2. Binary Arsenal (No Omissions)
    console.print("[*] Procuring Offensive Binary Arsenal...")
    binaries = [
        "nmap", "sqlmap", "nikto", "metasploit", "tcpdump", "netcat", 
        "hydra", "aircrack-ng", "wireshark", "tshark", "driftnet",
        "bettercap", "dnstracer", "whois", "dnsutils", "hping3"
    ]
    if is_termux:
        subprocess.run(["pkg", "install"] + binaries + ["-y"], check=False)
    
    # 3. Python Heavy Artillery
    console.print("[*] Deploying Neural Weaponry (Python Modules)...")
    python_deps = [
        "requests", "pyyaml", "pydantic", "rich", "prompt_toolkit", "httpx", 
        "tenacity", "jinja2", "fire", "exa-py", "firecrawl-py", "parallel-web", 
        "fal-client", "edge-tts", "PyJWT", "websockets", "nest-asyncio", "aiohttp", 
        "scapy", "beautifulsoup4", "selenium", "playwright", "playwright-stealth",
        "pycryptodome", "paramiko", "python-nmap", "impacket"
    ]
    subprocess.run([sys.executable, "-m", "pip", "install"] + python_deps, check=False)

    # 4. Manual Fallbacks (SearchSploit, etc.)
    if is_termux:
        console.print("[*] Forging Manual Links for Missing Assets...")
        subprocess.run(["bash", os.path.expanduser("~/hermes-sovereign-unified-v13.6/scripts/manual_arsenal_fix.sh")], check=False)

    console.print("[bold green][✓] TOTAL SYSTEM ANNIHILATION INSTALL COMPLETE. YOU ARE GOD MODE.[/]")

def main():
    if len(sys.argv) < 2:
        display_banner()
        return
    
    cmd = sys.argv[1].lower()
    if cmd in ["setup", "full-install", "annihilate"]:
        run_total_annihilation_install()
    elif cmd == "chat":
        # Logic to launch the agentic chat
        pass
    else:
        # Pass to core
        pass

if __name__ == "__main__":
    main()
