#!/usr/bin/bash

COMMIT_MSG="🧭 Backup: $(date)"
DATA_DIRECTORY="/data"

cd $DATA_DIRECTORY || exit

if [ ! -d $DATA_DIRECTORY"/.git" ]; then
    git init
fi

git add .
git commit -m "$COMMIT_MSG"
