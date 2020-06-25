#!/bin/bash
################################################################################
# This script generates CTAGS and CSCOPE database
#
# input : Base directory to generate database, Database will be generated in the
#         Component folder
#
################################################################################

if ! [ -z $PROJECT_SRC+x ]; then
  cd $PROJECT_SRC
  for d in */ ; do
    echo "$d"
    ${BASH_CONFIG}/scripts/cscope_component.sh ${PWD}/$d
  done
else
  echo "PROJECT_SRC env is not present"
fi
