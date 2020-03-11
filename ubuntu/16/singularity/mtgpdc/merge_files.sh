#!/bin/bash

INIT=$1
FINAL=$2
COUNT=$3
OUTFILE=$4
## mexp must be one of 3217, 4423, 11213, 23209, 44497, 110503 or 216091
mexp=44497
idx0=$(( INIT*COUNT ))
head -n 1 params${mexp}_${idx0}_${COUNT}.txt > ${OUTFILE}

for i in `seq ${INIT} ${FINAL}`
do
	idx=$(( i*COUNT ))
	tail -n ${COUNT} params${mexp}_${idx}_${COUNT}.txt >> ${OUTFILE}
done
