for calc in HF.BN_dimer_hard HF.BN_dimer_normal HF.C2_dimer_hard HF.C2_dimer_normal 
do
  for size in 15 25 35
  do
    for encut in 400 450 500 550 600 650 700 750 800 850 900 950 1000 1050 1100 1150 1200
    do
      for npos in 0 1 2 3 4
      do
        grep "y wi" ${calc}/box_${size}_${npos}/OUTCAR.HF.${encut}  | tail -n 1 | awk '{print $5}' | xargs -n 1 echo $size $encut $npos >> ${calc}/hf.log
        grep "y  wi" ${calc}/box_${size}_${npos}/OUTCAR.HF.${encut} | awk '{print $4}' | xargs -n 1 echo $size $encut $npos >> ${calc}/hf_dipol.log
      done
    done
  done
done

