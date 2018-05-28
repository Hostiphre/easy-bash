for dir in HF.BN_dimer_hard HF.BN_dimer_normal HF.C2_dimer_hard HF.C2_dimer_normal
do
  for encut in 500 800
  do
    grep " "${encut}" " ${dir}/hf.en.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $2-$4-$6}' > ${dir}/BN_dimer_hard.hf.en.${size}_0.dat
    grep " "${encut}" " ${dir}/hf.en.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $8-$4-$6}' > ${dir}/BN_dimer_hard.hf.${size}_-0.8.dat
    grep " "${encut}" " ${dir}/hf.en.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $10-$4-$6}' > ${dir}/BN_dimer_hard.hf.${size}_+0.8.dat
    grep " "${encut}" " ${dir}/hf_dipol.en.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $2-$4-$6}' > ${dir}/BN_dimer_hard.hf_dipol.${size}_0.dat
    grep " "${encut}" " ${dir}/hf_dipol.en.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $8-$4-$6}' > ${dir}/BN_dimer_hard.hf_dipol.${size}_-0.8.dat
    grep " "${encut}" " ${dir}/hf_dipol.en.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $10-$4-$6}' > ${dir}/BN_dimer_hard.hf_dipol.${size}_+0.8.dat
  done
done
