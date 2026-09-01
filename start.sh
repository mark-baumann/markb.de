#!/bin/bash
set -e

echo "=== markb.de WordPress Setup ==="

# Verzeichnisse anlegen
sudo mkdir -p /opt/data/wordpress/html /opt/data/wordpress/db
sudo chown -R $USER:$USER /opt/data/wordpress
echo "✅ Datenverzeichnisse bereit"

# .env prüfen
if [ ! -f .env ]; then
  echo "❌ .env fehlt — bitte aus .env.template erstellen und ausfüllen"
  exit 1
fi

# Starten
docker compose pull
docker compose up -d

echo ""
echo "✅ WordPress läuft!"
echo "   → https://markb.de"
echo "   → https://www.markb.de"
