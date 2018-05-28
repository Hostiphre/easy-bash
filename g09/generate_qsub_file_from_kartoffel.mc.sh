for foo in `ls *.gjf`
do
  cp kartoffel.sh x.sh
  sed -i "s/kartoffel.gjf/$foo/g" x.sh
  qsub x.sh
done
