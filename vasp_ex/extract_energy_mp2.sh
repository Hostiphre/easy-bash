for calc in MP2.BN_dimer_hard MP2.BN_dimer_normal MP2.C2_dimer_hard MP2.C2_dimer_normal 
do
  for size in 6 7 8
  do
    for encut in 400 450 500 550 600 650 700 750 800 850 900 950 1000 1050 1100 1150 1200
    do
      for npos in 0 1 2 3 4
      do
        grep "MP2 corr" ${calc}/box_${size}_${npos}/OUTCAR.MP2.${encut} | awk '{print $4}' | xargs -n 1 echo $size $encut $npos >> ${calc}/mp2.log
      done
    done
  done
done

