#!/bin/bash

[ -z "$SUDO_USER" ] && { echo "Scriptul nu a fost accesat cu sudo. Ex: sudo $0 <argumet>"; exit 1; }

[ $# -ne 1 ] && { echo "Scriptul functioneaza cu argument (start sau stop). Ex: sudo $0 start"; exit 1; }


if [ $1 == "start" ]; then
    echo "Verific daca folderul backup-log/ exista"
    if [ ! -d  "backup-log" ] ; then
        echo "Folderul nu exista il creez"
        mkdir backup-log
    else
        echo "Folderul exista, rulez in continuare"
    fi    
    if docker inspect -f '{{.State.Running}}' logger-container; then
        echo "Docker logger-container ruleaza deja. Efectuati sudo $0 stop"
    else
        docker build -t python-logger .
        docker run -d -v $(pwd)/persistent-logs:/app/logs --name logger-container python-logger
    fi    
elif [  $1 == "stop" ]; then
    docker stop logger-container
    docker rm logger-container
    # Logurile vor rămâne în folderul host: ./persistent-logs/activity.log
    cp persistent-logs/activity.log backup-log/
else
    echo "Argumentul introdus este gresit. Doar start sau stop."
    exit 1    
fi    