for calc in RPA.BN_dimer_hard RPA.BN_dimer_normal RPA.C2_dimer_hard RPA.C2_dimer_normal 
do
  for size in 6 7 8
  do
    for encut in 400 450 500 550 600 650 700 750 800 850 900 950 1000 1050 1100 1150 1200
    do
      for npos in 0 1 2 3 4
      do
        grep -i "converged value" ${calc}/box.${size}_${npos}/OUTCAR.RPAr.${encut} | awk '{print $4}' | xargs -n 1 echo $size $encut $npos >> ${calc}/rpa.log
        grep -A 2 "cutoff energy" ${calc}/box.${size}_${npos}/OUTCAR.RPAr.${encut} |tail -n 1 | awk '{print $3}' | xargs -n 1 echo $size $encut $npos >> ${calc}/rpa.raw.log 
      done
    done
  done
done

