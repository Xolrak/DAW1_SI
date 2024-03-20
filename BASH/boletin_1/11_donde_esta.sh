#!/bin/bash
# el "tr" reemplaza lo que le ponga en las primeras ("") por lo que le pongamos en las segundas ("")
for i in `echo $PATH | tr "." " "`
do
    if [ -x $i/$1 ]; then
    echo localizado en $i
    man -f $1
    fi
done