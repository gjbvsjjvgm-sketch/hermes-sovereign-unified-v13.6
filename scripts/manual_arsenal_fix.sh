#!/bin/bash
echo "[*] Starting Sovereign Manual Arsenal Fix..."
pkg install tur-repo unstable-repo -y
pkg update -y
pkg install exploitdb argus argus-clients -y || {
    echo "[!] PKG failed. Forging manual searchsploit..."
    git clone https://gitlab.com/exploit-database/exploitdb.git $HOME/.exploitdb
    ln -sf $HOME/.exploitdb/searchsploit $PREFIX/bin/searchsploit
}
echo "[✓] Manual Fix Complete."
