for dir in `ls -d */`
do
  cd $dir
  for mer in 0 1 2
  do
    cd $mer
    grep 'converged value' OUT* | awk '{print $4}' > er
    grep 'converged value' OUT* | awk '{print $4}' |xargs -n 1 echo $(grep 'gy  wi' OUTCAR.exx |awk '{print $4}') |bc > ee  
    ls OUTCAR.RPA* | xargs -n 1 | tr '.' ' ' |awk '{print $2 " " $3}' > nbands
    paste nbands er ee | xargs -n 4 echo $(pwd | tr '/' ' ' | tr '_' ' ' |awk '{print $16 " " $17 " " $18 " " $19 " "}')
    cd ..
  done
  cd ..
done

