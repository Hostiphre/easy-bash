
for calc in exx.BN_dimer_hard exx.BN_dimer_normal exx.C2_dimer_hard exx.C2_dimer_normal 
do
  rm ${calc}/exx.en.log ${calc}/exx_dipol.en.log
  for encut in 500 800
  do
    for size in 10 15 20 25 30 35 40 45 50 55 60
    do
      for npos in 0 1 2 3 4
      do
	if [ $size == 15 ] || [ $size == 25 ] || [ $size == 35 ]
	then
          grep "y wi" ${calc}/box_${size}_${npos}/OUTCAR.exx.${encut}  | tail -n 1 | awk '{print $5}' | xargs -n 1 echo $size $encut $npos >> ${calc}/exx.en.log
          grep "y  wi" ${calc}/box_${size}_${npos}/OUTCAR.exx.${encut} | awk '{print $4}' | xargs -n 1 echo $size $encut $npos >> ${calc}/exx_dipol.en.log
	else
          grep "y wi" ${calc}/en_${encut}_${npos}/OUTCAR.exx.len.${size}  | tail -n 1 | awk '{print $5}' | xargs -n 1 echo $size $encut $npos >> ${calc}/exx.en.log
          grep "y  wi" ${calc}/en_${encut}_${npos}/OUTCAR.exx.len.${size} | awk '{print $4}' | xargs -n 1 echo $size $encut $npos >> ${calc}/exx_dipol.en.log
        fi
      done
    done
  done
done

