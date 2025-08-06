#!/bin/bash

[ -z "$SUDO_USER" ] && { echo "Scriptul nu a fost accesat cu sudo. Ex: sudo start.sh"; exit 1; }

if docker ps --format '{{.Names}}' | grep -q "^nginx-static$"; then
    docker stop nginx-static;  docker rm -f nginx-static 2>/dev/null; docker run -d -p 8080:80 -v $(pwd)/static-content:/usr/share/nginx/html --name nginx-static nginx
else
    docker rm -f nginx-static 2>/dev/null; docker run -d -p 8080:80 -v $(pwd)/static-content:/usr/share/nginx/html --name nginx-static nginx       
fi    

echo "Acceseaza in browser http://localhost:8080/content.html" 