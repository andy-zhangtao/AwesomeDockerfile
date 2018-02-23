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
      echo "=== Ready to push ==="
      git branch
      git config --global user.email $GITEMAIL
      git config --global user.name $GITUSR
      git add -f *
      git commit -m "Add Vendor Package"
      curl -sS https://gist.githubusercontent.com/andy-zhangtao/498cab5c6035dcf0a31dfa8766427ee3/raw/101d9667b101a2982d53dda06c1b780c4c1f7e31/ExpectForGit.exp > script.exp
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
