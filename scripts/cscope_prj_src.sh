cd $PROJECT_SRC
for d in */ ; do
  echo "$d"
  ${HOME}/scripts/cscope_gen.sh ${PWD}/$d
done
