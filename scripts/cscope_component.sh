#!/bin/bash
################################################################################
# This script generates CTAGS and CSCOPE database
#
# input : Base directory to generate database
#
################################################################################
if test $# -eq 1
then
COMPONENT_BASE=$1
else
  if ! [ -z $BASE_DIR+x ];
  then
    COMPONENT_BASE=$BASE_DIR
  fi
  COMPONENT_BASE=$PWD
fi

echo "Component Base is: $COMPONENT_BASE"

rm -f  $COMPONENT_BASE/cscope.*
find -L $COMPONENT_BASE -name '*.h' > $COMPONENT_BASE/cscope.files
find -L $COMPONENT_BASE -name '*.cc' >> $COMPONENT_BASE/cscope.files
find -L $COMPONENT_BASE -name '*.cpp' >> $COMPONENT_BASE/cscope.files
find -L $COMPONENT_BASE -name '*.c' >> $COMPONENT_BASE/cscope.files

cd ${COMPONENT_BASE}
ctags --c++-kinds=+p --fields=+iaS --extra=+q -L $COMPONENT_BASE/cscope.files
/usr/bin/cscope -b -q -k
#cscope -qbR -i cscope.files
