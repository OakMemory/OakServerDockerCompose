#!/usr/bin/bash

EULA_FILE="eula.txt"
SERVER_DIRECTORY="/data/"
JAVA_PATH="java"

cd $SERVER_DIRECTORY || exit

# Check EULA file
if [ ! -f $EULA_FILE ]; then
    echo 'eula=true' >>$EULA_FILE
fi

if [[ "$USE_AUTHLIB_INJECT" != "false" ]]; then
    $JAVA_PATH -javaagent:/paper/authlib.jar="$USE_AUTHLIB_SERVER" -jar /paper/paper.jar -Xmx="$MAX_MEM" -Xms="$MIM_MEM" "$JVM_ARGS"
else
    $JAVA_PATH -jar /paper/paper.jar -Xmx="$MAX_MEM" -Xms="$MIM_MEM" "$JVM_ARGS"
fi
