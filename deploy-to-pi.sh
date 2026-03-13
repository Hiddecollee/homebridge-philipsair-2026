#!/bin/bash
# Deploy homebridge-philipsair-2026 fixes naar GitHub en Pi
set -e

echo "=== 1. Push naar GitHub ==="
cd "$(dirname "$0")"
git add -A
git status
read -p "Commit en push? (j/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[jJ]$ ]]; then
  git commit -m "Fix: AccessoriesHandler, rotationSpeed, NaN/undefined - v1.0.8"
  git push origin main
  echo "Gepusht naar GitHub."
else
  echo "Overgeslagen. Run handmatig: git add -A && git commit -m '...' && git push"
fi

echo ""
echo "=== 2. Op de Pi uitvoeren (kopieer en plak): ==="
echo ""
cat << 'PI_CMDS'
ssh hiddecollee@192.168.178.32 << 'ENDSSH'
cd /var/lib/homebridge
npm uninstall homebridge-philipsair-2026
npm install github:Hiddecollee/homebridge-philipsair-2026
sudo hb-service restart
echo "Klaar. Check: tail -f /var/lib/homebridge/homebridge.log"
ENDSSH
PI_CMDS
