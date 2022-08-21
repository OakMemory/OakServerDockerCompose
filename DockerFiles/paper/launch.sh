#!/usr/bin/bash

EULA_FILE="eula.txt"
SERVER_DIRECTORY="/data/"
JAVA_PATH="java"

cd $SERVER_DIRECTORY || exit

# Check EULA file
if [ ! -f $EULA_FILE ]; then
    echo 'eula=true' >>$EULA_FILE
fi

$JAVA_PATH -jar /paper/paper.jar
