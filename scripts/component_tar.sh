#!/bin/sh

IN=$BASE_DIR
if test $# -eq 1
then
IN=$PROJECT_SRC/$1
fi

CONDITION=5

ARRAY=$(echo $IN | tr "/" "\n")

idx=0
DEST_FOLDER=""
DELIMIT="/"

for x in $ARRAY
do
let idx+=1
done
echo $idx

let CONDITION=$idx-1
idx=0

for x in $ARRAY
do
    if [ $idx -eq $CONDITION ]
    then
        COMPONENT_TAR=$x.tgz
        COMPONENT=$x
    elif [ $idx -lt $CONDITION ]
    then
        DEST_FOLDER="$DEST_FOLDER/$x"
    fi
    let idx+=1
done
echo $COMPONENT_TAR
echo "Dest@"$DEST_FOLDER
cd $DEST_FOLDER
tar cvzf $COMPONENT_TAR --exclude .git $COMPONENT --dereference
