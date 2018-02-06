#!/usr/bin/env bash

cd $1
if [ "x$DEP" = 'xtrue' ]; then
  echo "***********"
  echo "****DEP****"
  if [ -f Gopkg.lock ]
  then
    dep ensure -v --update
  else
    dep init -v
    dep ensure -v --update
  fi
fi
echo "****$1****"
echo "**Go Build**"
GOARCH=amd64 go build -o $2 ;mkdir -p $1/bin; mv $2 bin/
echo "**Complete**"
