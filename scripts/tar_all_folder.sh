cd $PWD
for d in *.log ; do
  echo "$d"
tar cvzf ${d}.tgz $d
done
