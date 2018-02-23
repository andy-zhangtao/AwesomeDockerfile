#!/usr/bin/env bash

cd $1
if [ "x$GITBRANCH" != 'x' ]; then
  git checkout $GITBRANCH
fi

git branch

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
  if [ "x$GITUSR" != 'x' ]; then
    if [ "x$GITPASS" != 'x' ]; then
      curl -sS https://gist.githubusercontent.com/andy-zhangtao/498cab5c6035dcf0a31dfa8766427ee3/raw/4d195eb05c8168ca9b29b73b49ede778cf8a0812/ExpectForGit.exp > script.exp
      expect script.exp
    fi
  fi
fi

if [ "x$BUILD" = 'xtrue' ]; then
  echo "****$1****"
  echo "**Go Build**"
  GOARCH=amd64 go build -o $2 ;mkdir -p $1/bin; mv $2 bin/
fi
echo "**Complete**"
