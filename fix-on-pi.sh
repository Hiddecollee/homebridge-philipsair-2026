#!/bin/bash
# Run dit script OP DE RASPBERRY PI (via SSH)
# Of kopieer en plak de commando's in de Homebridge Terminal

set -e
echo "=== Philips Air Plugin - schone installatie v1.0.8 ==="

cd /var/lib/homebridge

echo "1. Oude plugin verwijderen..."
npm uninstall homebridge-philipsair-2026 2>/dev/null || true
rm -rf node_modules/homebridge-philipsair-2026

echo "2. NPM cache legen..."
npm cache clean --force

echo "3. Installeren vanaf GitHub (met fixes)..."
npm install github:Hiddecollee/homebridge-philipsair-2026 --save

echo "4. Controleren of v1.0.8 is geïnstalleerd..."
grep -A1 "homebridge-philipsair" package.json || true
head -5 node_modules/homebridge-philipsair-2026/package.json 2>/dev/null || echo "Check package.json"

echo "5. Homebridge herstarten..."
sudo hb-service restart

echo ""
echo "Klaar! Check de logs: tail -f /var/lib/homebridge/homebridge.log"
echo "Je zou moeten zien: Loaded plugin: homebridge-philipsair-2026@1.0.8"
