#!/bin/bash

if [ ! -d $GOCACHE ]; then
        mkdir -p $GOCACHE
fi

MUMAX_SRC=$GOPATH/src/github.com/mumax/3
CGO_CFLAGS_ALLOW='(-fno-schedule-insns|-malign-double|-ffast-math)'

cd $MUMAX_SRC/cuda 

NVCC='nvcc -std c++03 --compiler-options -Werror --compiler-options -Wall -Xptxas -O3 -ptx'

for f in *.cu; do
	g=$(echo $f | sed 's/\.cu$//') # file basename
	for cc in 37 60 70 75; do
		if [[ $f -nt $g'_'$cc.ptx ]]; then
			echo $NVCC -gencode arch=compute_$cc,code=sm_$cc $f -o $g'_'$cc.ptx
			$NVCC -I/usr/local/cuda/include -gencode arch=compute_$cc,code=sm_$cc $f -o $g'_'$cc.ptx # error can be ignored
		fi
	done
	if [[ $f -nt $g'_wrapper.go' ]]; then
		./cuda2go $f || exit 1
	fi
done

cd $MUMAX_SRC

go install -v github.com/mumax/3/cmd/... 
