#!/usr/bin/env bash

cd $1 ; GOARCH=amd64 go build -o $2 ;mkdir -p $1/bin; mv $2 bin/
