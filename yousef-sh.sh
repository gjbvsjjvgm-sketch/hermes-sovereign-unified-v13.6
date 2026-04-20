#!/bin/bash
proot-distro login ubuntu -- bash -c "source /root/sovereign_env/bin/activate && export PYTHONPATH=/root/hermes-sovereign-worm-v2 && /root/sovereign_env/bin/python3 /root/hermes-sovereign-worm-v2/yousef_shtiwe_cli/main.py \$@"
