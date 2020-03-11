#!/bin/sh
# Custom environment shell code should follow

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export DEBIAN_FRONTEND=noninterative
export TERM=xterm

alias ls='ls --color=auto'
alias ll='ls -lah'

export MODULEPATH=/usr/local/modulefiles/dev
