for dir in MP2.BN_dimer_hard MP2.BN_dimer_normal MP2.C2_dimer_hard MP2.C2_dimer_normal
do
  for size in 6 7 8
  do
    grep ^${size} ${dir}/mp2.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $2-$4-$6}' > ${dir}/BN_dimer_hard.mp2.${size}_0.dat
    grep ^${size} ${dir}/mp2.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $8-$4-$6}' > ${dir}/BN_dimer_hard.mp2.${size}_-0.8.dat
    grep ^${size} ${dir}/mp2.log |awk '{print $2 " " $4}' | xargs -n 10 |awk '{print $1 " " $10-$4-$6}' > ${dir}/BN_dimer_hard.mp2.${size}_+0.8.dat
  done
done

