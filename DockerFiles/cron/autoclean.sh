#!/bin/bash

DATA_DIRECTORY="/data"

cd $DATA_DIRECTORY || exit

rm -rf ./logs/*.gz
