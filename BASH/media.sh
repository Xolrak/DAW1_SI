#!/bin/bash 
clear
I=0
MEDIA=0
for num in $*
do
  let MEDIA+=$num
  let+=1
done
let MEDIA/=$I
echo "La media es $MEDIA"