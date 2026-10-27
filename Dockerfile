# Basis-Image
FROM nginx:1.27-alpine

# Kopiere die HTML-Datei in das Standardverzeichnis von Nginx
COPY anwendungen/ /usr/share/nginx/html/

# (Optional) Setze die richtigen Rechte für den Nginx-Benutzer
RUN chown -R nginx:nginx /usr/share/nginx/html
