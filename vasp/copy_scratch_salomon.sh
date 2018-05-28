for dir in `ls -d exx*dimer*/*`
do
  cd $dir
  job=`ls *.o* |xargs -n 1|cut -c 6-12 |tail -n 1`
  cp /scratch/work/user/hostiphre/$job*/OUTCAR* .
  cd ../..
done

for dir in `ls -d HF*dimer*/*`
do
  cd $dir
  job=`ls *.o* |xargs -n 1|cut -c 5-11 |tail -n 1`
  cp /scratch/work/user/hostiphre/$job*/OUTCAR* .
  cd ../..
done

for dir in `ls -d MP2*dimer*/*`
do
  cd $dir
  job=`ls *.o* |xargs -n 1|cut -c 6-12 |tail -n 1`
  cp /scratch/work/user/hostiphre/$job*/OUTCAR* .
  cd ../..
done
