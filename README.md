# Maki-Sandbox (Basis-Version)

Dieses Repository enthält die Basis-Version der Maki-Sandbox. Es handelt sich um eine einfache Webseite (HTML), die in einem Docker-Container (Nginx) läuft. 

Diese Umgebung dient als sichere, lokale Spielwiese für die Umschulung, damit ihr gefahrlos testen könnt, ohne den produktiven Proxmox-Server zu belasten.

> **Hinweis:** Dies ist ein **Beispiel** mit einem einfachen Webserver. Ihr könnt den Ordner `anwendungen/` und die `docker-compose.yml` nach Belieben anpassen, um eure eigenen Dienste (z. B. eine Datenbank oder andere Webanwendungen) nach diesem Schema zu erstellen und zu testen.

## Voraussetzungen
Bevor ihr startet, stellt bitte sicher, dass folgende Software auf eurem Rechner installiert ist:
*   **Git** (zum Herunterladen des Projekts)
*   **Docker** (bzw. Docker Desktop) 

## Schnellstart (So startet ihr die Sandbox)

1. Öffnet euer Terminal (macOS/Linux) oder die PowerShell (Windows).
2. Klont dieses Repository (ladet es herunter):
   ```bash
   git clone https://github.com/MakiGmbH/maki-sandbox-basic.git
   ```
3. Wechselt in den Ordner:
   ```bash
   cd maki-sandbox-basic
   ```

4. Startet den Container im Hintergrund:
   ```bash
   docker compose up -d --build
   ```

5. Öffnet euren Browser und ruft folgende Adresse auf:
   **http://localhost:8080**
   *(Ihr solltet jetzt die Webseite "Hello World" sehen).*

> **Tipp für die Testumgebung:** Andere Geräte im selben Netzwerk (z. B. euer Smartphone oder ein anderer PC) können die Seite ebenfalls aufrufen, indem sie die IP-Adresse eures Rechners im Browser eingeben: `http://<IP-Adresse-Eures-PCs>:8080`.

## Wie stoppe ich die Sandbox wieder?
Wenn ihr fertig seid, führt diesen Befehl im Terminal aus:
```bash
docker compose down
```

## Was liegt in diesem Repository?
*   `anwendungen/` – Enthält die HTML-Datei, die im Browser angezeigt wird.
*   `Dockerfile` – Die Bauanleitung für den Container.
*   `docker-compose.yml` – Die Konfiguration, die den Container startet.

