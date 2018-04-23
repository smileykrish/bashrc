
for d in */ ; do
  echo "$d"
  ARRAY=$(echo $d | tr "/" "\n")
  echo "$ARRAY"
tar cvzf ${ARRAY}.tgz $d
done
