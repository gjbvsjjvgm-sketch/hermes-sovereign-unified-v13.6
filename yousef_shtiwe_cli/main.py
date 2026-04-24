# -*- coding: utf-8 -*-
import sys
import os
import subprocess
from rich.console import Console
from rich.panel import Panel
from rich.table import Table

console = Console()

def display_banner():
    banner = """
    ▄████▄   ▒█████   ██▒   █▓▓█████  ██▀███  ▓█████  ██▓  ▄████  ███▄    █     
   ▒██▀ ▀█  ▒██▒  ██▒▓██░   █▒▓█   ▀ ▓██ ▒ ██▒▓█   ▀ ▓██▒ ██▒ ▀█▒ ██ ▀█   █     
   ▒▓█    ▄ ▒██░  ██▒ ▓██  █▒░▒███   ▓██ ░▄█ ▒▒███   ▒██░▒██░▄▄▄░▓██  ▀█ ██▒    
   ▒▓▓▄ ▄██▒▒██   ██░  ▒██ █░░▒▓█  ▄ ▒██▀▀█▄  ▒▓█  ▄ ▒██░░▓█  ██▓▓██▒  ▐▌██▒    
   ▒ ▓███▀ ░░ ████▓▒░   ▒▀█░  ░▒████▒░██▓ ▒██▒░▒████▒░██░░▒▓███▀▒▒██░   ▓██░    
    """
    console.print(banner, style="bold #BF00FF")
    console.print(Panel("[bold #00FF00] YOUSEF SHTIWE - SOVEREIGN SUPREMACY V13.6 [/]", border_style="#00FF00"))

def show_arsenal_menu():
    table = Table(title="Sovereign Arsenal - Specialized Offensive Tools", show_header=True, header_style="bold cyan")
    table.add_column("Command", style="dim")
    table.add_column("Description")
    
    table.add_row("yousef payload", "Generate real APK/EXE/PDF payloads")
    table.add_row("yousef inject", "Hide payloads in Images/PDFs (Steganography)")
    table.add_row("yousef reverse", "Decompile APKs and audit binaries")
    table.add_row("yousef growth", "Social Engagement Booster (Followers/Likes)")
    table.add_row("yousef network", "WiFi/4G Signaling Audit (Rootless)")
    
    console.print(table)

def main():
    if len(sys.argv) < 2:
        display_banner()
        show_arsenal_menu()
        return

    cmd = sys.argv[1].lower()
    
    if cmd == "setup":
        # Call the existing setup logic
        console.print("[*] Initiating Full System Annihilation...")
        pass
    
    elif cmd == "payload":
        # logic to handle payload generation
        console.print("[bold yellow][!] Usage: yousef payload <platform> <lhost> <lport> <name>[/]")
        # Example: yousef payload android 192.168.1.5 4444 exploit
        if len(sys.argv) >= 6:
            from offensive_modules.arsenal import get_arsenal
            ars = get_arsenal()
            res = ars.generate_payload(sys.argv[2], sys.argv[3], sys.argv[4], sys.argv[5])
            console.print(res)
    
    elif cmd == "reverse":
        if len(sys.argv) >= 3:
            from offensive_modules.arsenal import get_arsenal
            ars = get_arsenal()
            res = ars.reverse_apk(sys.argv[2])
            console.print(res)
            
    else:
        # Pass unknown commands to the core agent logic
        pass

if __name__ == "__main__":
    main()
