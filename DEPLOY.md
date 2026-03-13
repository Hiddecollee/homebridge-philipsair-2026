# Deploy naar Raspberry Pi – alle fixes

Deze versie (1.0.8) bevat fixes voor:
- `AccessoriesHandler is not a constructor` (verkeerde import)
- `Cannot read properties of undefined (reading 'toString')` (rotationSpeed)
- `characteristic value expected valid finite number and received "NaN"` (pwr, iaql, pm25, etc.)

## Stap 1: Push naar GitHub (op je Mac)

```bash
cd /Users/hiddecollee/homebridge-philipsair-2026
git add -A
git status   # controleer de wijzigingen
git commit -m "Fix: AccessoriesHandler, rotationSpeed, NaN/undefined - v1.0.8"
git push origin main
```

## Stap 2: Op de Raspberry Pi – plugin opnieuw installeren

SSH naar je Pi:
```bash
ssh hiddecollee@192.168.178.32
```

Dan:
```bash
cd /var/lib/homebridge
npm uninstall homebridge-philipsair-2026
npm install github:Hiddecollee/homebridge-philipsair-2026
sudo hb-service restart
```

## Stap 3: Verificatie

```bash
tail -f /var/lib/homebridge/homebridge.log
```

Je zou moeten zien:
- `[PhilipsAirPlatform2024] Initializing Luchtzuiveraar`
- `Homebridge v1.11.2 is running on port 51430`
- Geen `AccessoriesHandler is not a constructor`
- Geen `Cannot read properties of undefined`
- Geen `characteristic value expected valid finite number`

## Als het nog faalt

1. **Cache legen en opnieuw installeren:**
   ```bash
   cd /var/lib/homebridge
   npm cache clean --force
   rm -rf node_modules/homebridge-philipsair-2026
   npm install github:Hiddecollee/homebridge-philipsair-2026
   ```

2. **aioairctrl controleren:**
   ```bash
   pip3 list | grep aioairctrl
   # of
   aioairctrl -H 192.168.178.243 status
   ```
