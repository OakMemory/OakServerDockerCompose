#!/usr/bin/bash

EULA_FILE="eula.txt"
SERVER_DIRECTORY="/data/"
JAVA_PATH="java"

cd $SERVER_DIRECTORY || exit

# Check EULA file
if [ ! -f $EULA_FILE ]; then
    echo 'eula=true' >>$EULA_FILE
fi

if [[ $USE_AUTHLIB_INJECT != "false" ]]; then
    $JAVA_PATH -server -javaagent:/paper/authlib.jar="$USE_AUTHLIB_SERVER" -Xmx"$MAX_MEM" "$JVM_ARGS" -jar /paper/paper.jar
else
    $JAVA_PATH -server -Xmx"$MAX_MEM" "$JVM_ARGS" -jar /paper/paper.jar
fi
