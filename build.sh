#!/bin/bash

echo "Script name: build amazonlinux 2"
echo "********************************"

docker build --force-rm --tag am2-dkmachine:dev .
