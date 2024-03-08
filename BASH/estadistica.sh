#!/bin/bash
lectura=0
escritura=0
ejecucion=0
sin_lectura=0
sin_escritura=0
sin_ejecucion=0

for i in `find $1 2>/dev/null`
do
    if [ -r $i ]
    then
        let lectura+=1
    else
        let sin_lectura+=1
    fi
    if [ -w $i ]
    then
        let escritura+=1
    else
        let sin_escritura+=1
    fi
    if [ -x $i ]
    then
        let ejecucion +=1
    else
        let sin_ejecucion+=1