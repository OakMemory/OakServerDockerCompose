#!/usr/bin/bash

AUTHLIB_VERSION=$1
AUTHLIB_REPO=$2

echo authlib-injector repo: "${AUTHLIB_REPO}"
echo authlib-injector version: "${AUTHLIB_VERSION}"

git clone "$AUTHLIB_REPO" authlib
cd authlib || exit
git checkout "$AUTHLIB_VERSION"
gradle build
cd / || exit
mv /authlib/build/libs/*.jar /authlib.jar
