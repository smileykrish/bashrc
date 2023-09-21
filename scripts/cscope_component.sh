#!/bin/bash
################################################################################
# This script generates CTAGS and CSCOPE database
#
# input : Base directory to generate database
#
################################################################################

source $BASH_CONFIG/scripts/colors.sh

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

if test $# -eq 2
then
  FLAG=$2
else
  FLAG="src"
fi

# Split the path into array with the delimter of "/"
IFS='/' read -ra ARRAY <<< "$COMPONENT_BASE"
COMPONENT=${ARRAY[-1]}

printf "Component: ${GREEN}$COMPONENT${NC}\n"
printf "$COMPONENT_BASE"
rm -f  $COMPONENT_BASE/cscope.*
find $COMPONENT_BASE/ -path $COMPONENT_BASE/test -prune -false -o -name *.h > $COMPONENT_BASE/cscope.files
find $COMPONENT_BASE/ -path $COMPONENT_BASE/test -prune -false -o -name *.cc >> $COMPONENT_BASE/cscope.files
find $COMPONENT_BASE/ -path $COMPONENT_BASE/tests -prune -false -o -name *.py >> $COMPONENT_BASE/cscope.files
find $COMPONENT_BASE/ -name *.hpp >> $COMPONENT_BASE/cscope.files
find $COMPONENT_BASE/ -name *.cpp >> $COMPONENT_BASE/cscope.files
find $COMPONENT_BASE/ -name "*.h" >> $COMPONENT_BASE/cscope.files
find $COMPONENT_BASE/ -name *.c >> $COMPONENT_BASE/cscope.files

if [ "$FLAG" == "all" ]; then
  find $COMPONENT_BASE/ -path $COMPONENT_BASE/src -prune -false -o -name *.h >> $COMPONENT_BASE/cscope.files
  find $COMPONENT_BASE/ -path $COMPONENT_BASE/src -prune -false -o -name *.cc >> $COMPONENT_BASE/cscope.files
fi
cd ${COMPONENT_BASE}
ctags --c++-kinds=+p --fields=+iaS --extra=+q -L $COMPONENT_BASE/cscope.files

if [ -s $COMPONENT_BASE/cscope.files ]; then
  cscope -qbR -i $COMPONENT_BASE/cscope.files
fi
