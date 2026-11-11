#!/usr/bin/env bash
# Create harmless dummy "company documents" for the ransomware simulation.
# Usage: bash create_test_files.sh [folder]
set -euo pipefail

DIR="${1:-$HOME/important}"
mkdir -p "$DIR"

for i in $(seq 1 15); do
  echo "Quarterly report $i - confidential figures: revenue=$((RANDOM * 10)) cost=$((RANDOM * 7))" > "$DIR/report_$i.txt"
done

echo "Created 15 test files in $DIR"
ls "$DIR"
