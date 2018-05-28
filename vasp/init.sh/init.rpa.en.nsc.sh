#! /bin/bash
#$ -S /bin/bash
OMP_NUM_THREADS=1
MKL_NUM_THREADS=1
source /opt/intel/parallel_studio_xe_2015/psxevars.sh
ulimit -s unlimited
VASP_GAM="mpirun -n 64 /data/home/ding/vasp/bin2/vasp_gam"
WORKDIR=`pwd`

ENCUT=500
ENCUTGW=$(echo ${ENCUT}*2/3 | bc)
cd $WORKDIR
# INCAR.DFT
echo "ENCUT=${ENCUT}; ISMEAR=0; SIGMA=1E-7; EDIFF=1E-8; PREC=Normal; IDIPOL=4" > INCAR.DFT
# INCAR.exx
echo "ENCUT=${ENCUT}; PREC=Normal; PRECFOCK=Normal; NELM=1; LWAVE=.FALSE." > INCAR.exx
echo "LHFCALC=.TRUE.; AEXX=1.0; ALDAC=0.0; AGGAC=0.0" >> INCAR.exx
echo "ALGO=Eigenval; LMAXFOCKAE=4" >> INCAR.exx
echo "ISMEAR=0; SIGMA=1E-7" >> INCAR.exx
# INCAR.exact
echo "ENCUT=${ENCUT}; ALGO=Exact; PREC=Normal; PRECFOCK=Normal" > INCAR.exact
echo "ISMEAR=0; SIGMA=1E-7; NELM=1; LOPTICS=.TRUE." >> INCAR.exact
# INCAR.RPAr
echo "ENCUT=${ENCUT}; ENCUTGW=${ENCUTGW}; ALGO=ACFDTR; NOMEGA=8; PREC=Normal; PRECFOCK=Normal" > INCAR.RPAr
echo "ISMEAR=0; SIGMA=1E-7; LWAVE=.FALSE." >> INCAR.RPAr
# INCAR.single
echo "ENCUT=${ENCUT}; ENCUTGW=${ENCUTGW}; ALGO=GW0R; NOMEGA=8; NATURALO=12; PREC=Normal; PRECFOCK=Normal" > INCAR.single
echo "ISMEAR=0; SIGMA=1E-7; LWAVE=.FALSE." >> INCAR.single

for LEN in 9 10 11 12
do
# POSCAR
  cp POSCAR.temp POSCAR
  LEN1=${LEN}
  LEN2=$(echo ${LEN}+1 | bc)
  LEN3=$(echo ${LEN}+2 | bc)
  echo "sed -i 's/^LEN 0. 0./${LEN1}. 0. 0./g' POSCAR" | sh
  echo "sed -i 's/^0. LEN 0./0. ${LEN2}. 0./g' POSCAR" | sh
  echo "sed -i 's/^0. 0. LEN/0. 0. ${LEN3}./g' POSCAR" | sh
# DFT
  cp INCAR.DFT INCAR
  $VASP_GAM
  mv OUTCAR OUTCAR.DFT.len.${LEN}
# exx
  cp INCAR.exx INCAR
  $VASP_GAM
  mv OUTCAR OUTCAR.exx.len.${LEN}
# NBANDS
  NBANDS_=`grep -m 1 "maximum number" OUTCAR.exx.len.${LEN} | cut -c 35- | tr -d " " `
  NBANDS=`echo "$NBANDS_ * 2" | bc -l`
# Exact
  cp INCAR.exact INCAR
  echo "NBANDS=${NBANDS}" >> INCAR
  $VASP_GAM
  mv OUTCAR OUTCAR.exact.len.${LEN}
# RPAr
  cp INCAR.RPAr INCAR
  echo "NBANDS=${NBANDS}" >> INCAR
  $VASP_GAM
  mv OUTCAR OUTCAR.RPAr.len.${LEN}
# Single
  cp INCAR.single INCAR
  echo "NBANDS=${NBANDS}" >> INCAR
  $VASP_GAM
  mv OUTCAR OUTCAR.single.len.${LEN}
  rm W* C*
done



