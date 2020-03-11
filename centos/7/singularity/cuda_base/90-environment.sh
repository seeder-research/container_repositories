#!/bin/sh
# Custom environment shell code should follow

export PATH=/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export LD_LIBRARY_PATH=/usr/local/cuda/lib64
export INCLUDE_PATH=/usr/local/cuda/include:$INCLUDE_PATH
export CPATH=/usr/local/cuda/include:$CPATH
export TERM=xterm

alias ls='ls --color=auto'
alias ll='ls -lah'
