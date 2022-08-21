#!/usr/bin/bash

echo eula=true >/data/eula.txt
export PWD=/data
java -jar /paper/core.jar
