#!/bin/bash
rotar()
{
    if [ -s old_rot/$FICH.rot4.gz ]
        then rm old_rot/$FICH.rot4.gz
    fi
    if [ -s old_rot/$FICH.rot3.gz ]
        then rm old_rot/$FICH.rot3.gz old_rot/$FICH.rot4.gz
    fi
    if [ -s old_rot/$FICH.rot2.gz ]
        then rm old_rot/$FICH.rot2.gz old_rot/$FICH.rot3.gz
    fi
    if [ -s old_rot/$FICH.rot1.gz ]
        then rm old_rot/$FICH.rot1.gz old_rot/$FICH.rot2.gz
    fi
    cp $FICH old_rot/$FICH.rot1
    gzip old_rot/$FICH.rot1
    > $FICH
}
mkdir old_rot 2> /dev/null
for FICH in `ls *.log`
do
    LINEAS=`cat $FICH | wc -l`
    if [ -LINEAS -gt 50 ]
        then
            echo "$FICH tiene $LINEAS ==> lo voy a rotar"
            rotar
        else
            echo "$FISH tiene $LINEAS"
    fi
done