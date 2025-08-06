#!/bin/bash

[ -z "$SUDO_USER" ] && { echo "Scriptul nu a fost accesat cu sudo. Ex: sudo $0"; exit 1; }

docker build -t python-base:latest .
docker tag python-base:latest vtscorpio/python-base:latest
docker login
docker push vtscorpio/python-base:latest  # Inlocuieste `user` cu numele tău de Docker Hub