for dir in HF.BN_dimer_hard HF.BN_dimer_normal HF.C2_dimer_hard HF.C2_dimer_normal
do
  for size in 15 25 35
  do
    grep ^${size} ${dir}/hf.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $2-$4-$6}' > ${dir}/BN_dimer_hard.hf.${size}_0.dat
    grep ^${size} ${dir}/hf.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $8-$4-$6}' > ${dir}/BN_dimer_hard.hf.${size}_-0.8.dat
    grep ^${size} ${dir}/hf.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $10-$4-$6}' > ${dir}/BN_dimer_hard.hf.${size}_+0.8.dat
    grep ^${size} ${dir}/hf_dipol.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $2-$4-$6}' > ${dir}/BN_dimer_hard.hf_dipol.${size}_0.dat
    grep ^${size} ${dir}/hf_dipol.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $8-$4-$6}' > ${dir}/BN_dimer_hard.hf_dipol.${size}_-0.8.dat
    grep ^${size} ${dir}/hf_dipol.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $10-$4-$6}' > ${dir}/BN_dimer_hard.hf_dipol.${size}_+0.8.dat
  done
done

for dir in exx.BN_dimer_hard exx.BN_dimer_normal exx.C2_dimer_hard exx.C2_dimer_normal
do
  for size in 15 25 35
  do
    grep ^${size} ${dir}/exx.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $2-$4-$6}' > ${dir}/BN_dimer_hard.exx.${size}_0.dat
    grep ^${size} ${dir}/exx.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $8-$4-$6}' > ${dir}/BN_dimer_hard.exx.${size}_-0.8.dat
    grep ^${size} ${dir}/exx.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $10-$4-$6}' > ${dir}/BN_dimer_hard.exx.${size}_+0.8.dat
    grep ^${size} ${dir}/exx_dipol.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $2-$4-$6}' > ${dir}/BN_dimer_hard.exx_dipol.${size}_0.dat
    grep ^${size} ${dir}/exx_dipol.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $8-$4-$6}' > ${dir}/BN_dimer_hard.exx_dipol.${size}_-0.8.dat
    grep ^${size} ${dir}/exx_dipol.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $10-$4-$6}' > ${dir}/BN_dimer_hard.exx_dipol.${size}_+0.8.dat
  done
done
