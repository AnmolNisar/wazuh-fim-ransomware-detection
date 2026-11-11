#!/usr/bin/env bash
# Remove the test folder so the simulation can be run again.
# Usage: bash cleanup.sh [folder]
set -euo pipefail
DIR="${1:-$HOME/important}"
rm -rf "$DIR"
echo "Removed $DIR (FIM will log these deletions, which can also trigger rule 100202)."
