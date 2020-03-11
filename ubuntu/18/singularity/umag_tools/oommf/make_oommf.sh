#!/bin/bash

export OOMMF_TCL_CONFIG=/usr/lib/x86_64-linux-gnu/tcl8.6/tclConfig.sh
export OOMMF_TK_CONFIG=/usr/lib/x86_64-linux-gnu/tk8.6/tkConfig.sh
export OOMMF_WISH=/usr/bin/wish8.6

tclsh8.6 oommf.tcl pimake
