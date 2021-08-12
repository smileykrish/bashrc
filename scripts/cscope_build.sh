#!/bin/bash

rm -f  $PWD/cscope.*
for file in `find $PWD -name "cscope.files"` ; do
  cat $file >> $PWD/cscope.files
done
ctags -L $PWD/cscope.files
cscope -b -q -k
