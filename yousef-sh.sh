#!/bin/bash
PROJECT_ROOT=$(cd "$(dirname "$0")"; pwd)
export PYTHONPATH="$PROJECT_ROOT/hermes-agent:$PYTHONPATH"
python3 "$PROJECT_ROOT/yousef_shtiwe_cli/main.py" "$@"
