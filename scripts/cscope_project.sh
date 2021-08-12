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
  IFS=$'\n'

  for folder in `find . -mindepth 1 -maxdepth 1 \! -type l -exec ls -d {} + ` ; do
    if [ -d "${folder}" ]
    then
      ${BASH_CONFIG}/scripts/cscope_component.sh ${PWD}/$folder
    fi
  done
else
  echo "PROJECT_SRC env is not present"
fi
