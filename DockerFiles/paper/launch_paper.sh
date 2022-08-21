#!/usr/bin/bash

echo eula=true >/data/eula.txt
export PWD=/data
if [ ! -d .git ]; then
    git init
fi
java -jar /paper/core.jar
