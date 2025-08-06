#!/bin/bash

[ -z "$SUDO_USER" ] && { echo "Scriptul nu a fost accesat cu sudo. Ex: sudo $0"; exit 1; }

docker build -t user/python-base:latest .
docker login
docker push vtscorpio/python-base:latest  # Inlocuieste `user` cu utilizatorul de Docker Hub