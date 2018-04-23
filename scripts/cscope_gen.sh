#!/bin/bash

BASE_DIR=$PWD
if test $# -eq 1
then
BASE_DIR=$1
fi

echo "Argument is: $BASE_DIR"

rm -f  $BASE_DIR/cscope.*
find $BASE_DIR -name '*.h' > $BASE_DIR/cscope.files
find $BASE_DIR -name '*.cc' >> $BASE_DIR/cscope.files
find $BASE_DIR -name '*.cpp' >> $BASE_DIR/cscope.files
find $BASE_DIR -name '*.c' >> $BASE_DIR/cscope.files

cd ${BASE_DIR}
ctags --c++-kinds=+p --fields=+iaS --extra=+q -L $BASE_DIR/cscope.files
cscope -b -q -k
#cscope -qbR -i cscope.files
