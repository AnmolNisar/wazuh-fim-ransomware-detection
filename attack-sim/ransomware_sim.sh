#!/usr/bin/env bash
# SAFE ransomware SIMULATION for a lab VM. It only touches the test folder you pass in,
# overwrites the dummy files with random data ("encryption"), and drops a ransom note.
# It does not spread, does not use real encryption keys, and touches nothing else.
# Usage: bash ransomware_sim.sh [folder]
set -euo pipefail

DIR="${1:-$HOME/important}"
[[ -d "$DIR" ]] || { echo "Folder $DIR not found. Run create_test_files.sh first."; exit 1; }

echo "[*] 'Encrypting' files in $DIR ..."
for f in "$DIR"/*.txt; do
  [[ "$f" == *RANSOM* ]] && continue
  openssl rand -base64 96 > "$f"     # overwrite contents -> FIM rule 550 (modified)
  echo "    encrypted: $(basename "$f")"
  sleep 0.5
done

cat > "$DIR/README_RANSOM.txt" <<'NOTE'
YOUR FILES HAVE BEEN ENCRYPTED (lab simulation - nothing real happened).
NOTE
echo "[*] Ransom note dropped -> FIM rule 554 (added) -> custom rule 100200"
echo "===== SIMULATION DONE ====="
