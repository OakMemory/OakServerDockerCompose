#!/usr/bin/bash

EULA_FILE="/data/eula.txt"
SERVER_DIRECTORY="/data/"
JAVA_PATH="java"

# Check eula
if [ ! -f $EULA_FILE ]; then
    echo 'eula=true' >>$EULA_FILE
fi

# Init data directory
if ! git --exec-path=$SERVER_DIRECTORY log >>/dev/null; then
    git --exec-path=$SERVER_DIRECTORY init
fi

export PWD=$SERVER_DIRECTORY
$JAVA_PATH -jar /paper/paper.jar
