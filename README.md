# Maki-Sandbox (Cluster-Version)

Dieses Repository enthält die erweiterte Cluster-Version der Maki-Sandbox. Im Gegensatz zur Basis-Version wird die Webseite hier nicht über Docker Compose, sondern über einen lokalen Kubernetes-Cluster (k3d) bereitgestellt.

Diese Umgebung dient als fortgeschrittene, sichere Spielwiese für die Umschulung. Sie zeigt, wie moderne Orchestrierung funktioniert und wie Anwendungen deklarativ (über YAML-Dateien) bereitgestellt werden.

> **Hinweis:** Dies ist ein **Beispiel** mit einem einfachen Webserver. Die Struktur im Ordner `kubernetes/` könnt ihr als Vorlage nutzen, um eigene Dienste (z. B. Datenbanken oder andere Anwendungen) im Cluster zu betreiben. 

## Voraussetzungen
Bevor ihr startet, stellt bitte sicher, dass folgende Software auf eurem Rechner installiert ist:
*   **Git** (zum Herunterladen des Projekts)
*   **Docker** (bzw. Docker Desktop)
*   **k3d** (für den lokalen Kubernetes-Cluster)
*   **kubectl** (zur Steuerung des Clusters)

## Schnellstart (So startet ihr die Cluster-Sandbox)

1. Öffnet euer Terminal (macOS/Linux) oder die PowerShell (Windows).
2. Klont dieses Repository (ladet es herunter):
   ```bash
   git clone https://github.com/MakiGmbH/maki-sandbox-cluster.git
   ```
3. Wechselt in den Ordner:
   ```bash
   cd maki-sandbox-cluster
   ```

4. Startet den Kubernetes-Cluster (Port 8080 wird auf den Cluster gemappt):
   ```bash
   k3d cluster create maki-sandbox -p "8080:80@loadbalancer" --agents 1
   ```

5. Wendet die Konfigurationen an:
   ```bash
   kubectl apply -f kubernetes/
   ```

6. Öffnet euren Browser und ruft folgende Adresse auf:
   **http://localhost:8080**
   *(Ihr solltet jetzt die Webseite "Hello World" sehen).*

> **Tipp für die Testumgebung:** Andere Geräte im selben Netzwerk (z. B. euer Smartphone oder ein anderer PC) können die Seite ebenfalls aufrufen, indem sie die IP-Adresse eures Rechners im Browser eingeben: `http://<IP-Adresse-Eures-PCs>:8080`.

## Wie stoppe ich die Sandbox wieder?
Wenn ihr fertig seid, führt diesen Befehl im Terminal aus, um den Cluster zu löschen:
```bash
k3d cluster delete maki-sandbox
```

## Was liegt in diesem Repository?
*   `anwendungen/` – Enthält die HTML-Datei, die im Browser angezeigt wird.
*   `kubernetes/webserver-deployment.yaml` – Definiert die Webserver-Pods (inkl. Skalierung).
*   `kubernetes/webserver-service.yaml` – Der interne Dienst, der die Pods verbindet.
*   `kubernetes/webserver-configmap.yaml` – Bindet die HTML-Datei in den Cluster ein.
*   `kubernetes/webserver-ingress.yaml` – Ermöglicht den Zugriff von außen über den Ingress-Controller.
