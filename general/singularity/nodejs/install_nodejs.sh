#!/bin/bash

dist_id=`lsb_release -i`
link=""
pkgmgr=""
nodejs_ver=14

if [[ $dist_id =~ 'Ubuntu' ]]; then
    echo "Found Ubuntu distribution"
    link=https://deb.nodesource.com/setup_${nodejs_ver}.x
    pkgmgr=apt-get
else if [[ $dist_id =~ 'CentOS' ]]; then
    echo "Found CentOS distribution"
    link=https://rpm.nodesource.com/setup_${nodejs_ver}.x
    pkgmgr=yum
  else
    echo "Unrecognized distribution!"
    exit 1
  fi
fi

curl -sL $link | bash

if [ $pkgmgr == "apt-get" ]; then
    apt update
fi

$pkgmgr install -y nodejs

if [ $pkgmgr == "apt-get" ]; then
    rm -rf /var/lib/apt/lists/*
fi
