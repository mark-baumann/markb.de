# markb.de — WordPress via Docker + Cloudflare-Tunnel

WordPress-Site für markb.de, betrieben als Docker-Container auf dem Raspberry Pi, erreichbar über Cloudflare-Tunnel.

## Schnellstart

```bash
# 1. Secrets konfigurieren
cp .env.template .env
# → .env ausfüllen: TUNNEL_TOKEN, MYSQL_ROOT_PASSWORD, MYSQL_PASSWORD

# 2. Datenverzeichnisse anlegen
sudo mkdir -p /opt/data/wordpress/html /opt/data/wordpress/db

# 3. Starten
docker compose up -d

# 4. WordPress einrichten
# → https://markb.de öffnen → Installationsassistent
```

## Architektur

```
Internet → Cloudflare → markb.de (Tunnel) → wordpress:80 (Docker)
                                                   ↓
                                         wordpress-db:3306 (MariaDB)
```

## Dienste

| Service        | Image              | Zweck                        |
|----------------|--------------------|------------------------------|
| `wordpress`    | wordpress:latest   | WordPress-Anwendung          |
| `wordpress-db` | mariadb:11         | Datenbank                    |
| `cloudflared`  | cloudflare/cloudflared | Tunnel zu markb.de + www |

## Domains

- `https://markb.de` → WordPress
- `https://www.markb.de` → WordPress

## Daten

Persistent gespeichert in:
- `/opt/data/wordpress/html` — WordPress-Dateien (Themes, Plugins, Uploads)
- `/opt/data/wordpress/db` — MariaDB-Daten

## Aktualisieren

```bash
docker compose pull
docker compose up -d
```
