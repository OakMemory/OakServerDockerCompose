#!/bin/bash

COMMIT_MSG="🧭 Backup: $(date)"
DATA_DIRECTORY="/data"

cd $DATA_DIRECTORY || exit

git config --global user.email "$GIT_EMAIL"
git config --global user.email "$GIT_NAME"

if [ ! -d $DATA_DIRECTORY"/.git" ]; then
    if ! git init; then
        echo 'Failed to run git init!'
        exit
    fi
fi

if ! git add .; then
    echo 'Failed to add changes'
    exit
fi

if ! git commit -m "$COMMIT_MSG"; then
    echo 'Failed to commit changes'
fi
