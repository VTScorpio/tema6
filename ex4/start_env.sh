#!/bin/bash

[ -z "$SUDO_USER" ] && { echo "Scriptul nu a fost accesat cu sudo. Ex: sudo $0"; exit 1; }

docker build -t python-env-app .
docker run --env-file .env python-env-app
