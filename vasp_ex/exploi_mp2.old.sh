for dir in `ls -d */`
do
  cd $dir
  for mer in 0 1 2
  do
    cd $mer
    grep 'MP2 c' OUT* | awk '{print $5}' > em
    grep 'MP2 c' OUT* | awk '{print $5}' |xargs -n 1 echo $(grep 'gy  wi' OUTCAR.HF |awk '{print $4}') |bc > ee  
    ls OUTCAR.MP2.* | xargs -n 1 | tr '.' ' ' |awk '{print $3}' > nbands
    paste nbands em ee | xargs -n 3 echo $(pwd | tr '/' ' ' | tr '_' ' ' |awk '{print $16 " " $17 " " $18 " " $19 " "}')
    cd ..
  done
  cd ..
done

