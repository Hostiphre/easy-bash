rm *dat
# 0
for charge in BN_dimer_0 C2_dimer_0
do
  for basis in aVDZ aVTZ aVQZ
  do
    for mer in 1 2 3 4 5
    do
      grep 'RHF STATE 1.1 Energy' *${charge}/*${basis}*out| head -n ${mer}| tail -n 1| awk '{print $5}' >> ${charge}_${mer}_HF.dat 
      grep '^ New refer' *${charge}/*${basis}*out| head -n `echo ${mer}*3|bc`| tail -n 1| awk '{print $4}' >> ${charge}_${mer}_HF-F12.dat 
    # grep '^ MP2 corr' *${charge}/*${basis}*out| head -n ${mer}| tail -n 1| awk '{print $4}' >> ${charge}_${mer}_MP2_corr.dat 
      grep 'MP2-F12/3C(F) corr' *${charge}/*${basis}*out| head -n ${mer}| tail -n 1| awk '{print $4}' >> ${charge}_${mer}_MP2-F12_corr.dat 
    # grep '^ MP2 total' *${charge}/*${basis}*out| head -n ${mer}| tail -n 1| awk '{print $4}' >> ${charge}_${mer}_MP2.dat 
      grep 'MP2-F12/3C(F) total' *${charge}/*${basis}*out| head -n ${mer}| tail -n 1| awk '{print $4}' >> ${charge}_${mer}_MP2-F12.dat 
    # grep 'CCSD(T) total' *${charge}/*${basis}*out| head -n ${mer}| tail -n 1| awk '{print $4}' >> ${charge}_${mer}_CCSD\(T\).dat 
      grep '!CCSD(T)-F12a' *${charge}/*${basis}*out| head -n `echo ${mer}*2-1|bc`| tail -n 1| awk '{print $4}' >> ${charge}_${mer}_CCSD\(T\)-F12a.dat 
      grep '!CCSD(T)-F12b' *${charge}/*${basis}*out| head -n `echo ${mer}*2-1|bc`| tail -n 1| awk '{print $4}' >> ${charge}_${mer}_CCSD\(T\)-F12b.dat 
      grep '!CCSD(T)-F12a' *${charge}/*${basis}*out| head -n `echo ${mer}*2|bc`| tail -n 1| awk '{print $4}' >> ${charge}_${mer}_CCSD\(T\)-F12a.ST.dat 
      grep '!CCSD(T)-F12b' *${charge}/*${basis}*out| head -n `echo ${mer}*2|bc`| tail -n 1| awk '{print $4}' >> ${charge}_${mer}_CCSD\(T\)-F12b.ST.dat 
    done
  done
done

# -0.8/0.8
for charge in BN_dimer_-0.8 C2_dimer_-0.8 BN_dimer_+0.8 C2_dimer_+0.8 
do
  for basis in aVDZ aVTZ aVQZ
  do
    for mer in 1 2 3
    do
      grep 'RHF STATE 1.1 Energy' *${charge}/*${basis}*mp2*out| head -n ${mer}| tail -n 1| awk '{print $5}' >> ${charge}_${mer}_HF.dat 
      grep '^ New refer' *${charge}/*${basis}*mp2*out| head -n ${mer}| tail -n 1| awk '{print $4}' >> ${charge}_${mer}_HF-F12.dat
      grep 'MP2-F12/3C(F) corr' *${charge}/*${basis}*out| head -n ${mer}| tail -n 1| awk '{print $5}' >> ${charge}_${mer}_MP2-F12_corr.dat 
      grep 'MP2-F12/3C(F) total' *${charge}/*${basis}*out| head -n ${mer}| tail -n 1| awk '{print $5}' >> ${charge}_${mer}_MP2-F12.dat
      grep '!CCSD(T)-F12a' *${charge}/*${basis}*f12.out| head -n ${mer}| tail -n 1| awk '{print $5}' >> ${charge}_${mer}_CCSD\(T\)-F12a.dat 
      grep '!CCSD(T)-F12b' *${charge}/*${basis}*f12.out| head -n ${mer}| tail -n 1| awk '{print $5}' >> ${charge}_${mer}_CCSD\(T\)-F12b.dat 
      grep '!CCSD(T)-F12a' *${charge}/*${basis}*st.out| head -n ${mer}| tail -n 1| awk '{print $4}' >> ${charge}_${mer}_CCSD\(T\)-F12a.ST.dat 
      grep '!CCSD(T)-F12b' *${charge}/*${basis}*st.out| head -n ${mer}| tail -n 1| awk '{print $4}' >> ${charge}_${mer}_CCSD\(T\)-F12b.ST.dat 
    done
  done
done

# cp/i
for compound in BN_dimer C2_dimer
do
  for charge in 0 -0.8 +0.8 
  do
    for calc in HF HF-F12 MP2-F12_corr MP2-F12 CCSD\(T\)-F12a CCSD\(T\)-F12b CCSD\(T\)-F12a.ST CCSD\(T\)-F12b.ST
    do
      paste ${compound}_${charge}_1_${calc}.dat ${compound}_${charge}_2_${calc}.dat ${compound}_${charge}_3_${calc}.dat| awk '{print $1-$2-$3}' >> ${compound}_${charge}_cp_${calc}.dat
      paste ${compound}_${charge}_1_${calc}.dat ${compound}_0_4_${calc}.dat ${compound}_0_5_${calc}.dat| awk '{print $1-$2-$3}' >> ${compound}_${charge}_i_${calc}.dat
    done
  done
done
