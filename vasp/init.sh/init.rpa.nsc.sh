#! /bin/bash
#$ -S /bin/bash
OMP_NUM_THREADS=1
MKL_NUM_THREADS=1
source /opt/intel/parallel_studio_xe_2015/psxevars.sh
ulimit -s unlimited
VASP_GAM="mpirun -n 16 /data/home/ding/vasp/bin2/vasp_gam"
WORKDIR=`pwd`

cd $WORKDIR
# INCAR.DFT
echo "ISMEAR=0; SIGMA=1E-7; EDIFF=1E-8; PREC=Normal; LASPH=.TRUE.; IDIPOL=4" > INCAR.DFT
# INCAR.exx
echo "PREC=Normal; PRECFOCK=Normal; NELM=1; LWAVE=.FALSE." > INCAR.exx
echo "LHFCALC=.TRUE.; AEXX=1.0; ALDAC=0.0; AGGAC=0.0" >> INCAR.exx
echo "ALGO=Eigenval; LMAXFOCKAE=4; LASPH=.TRUE." >> INCAR.exx
echo "ISMEAR=0; SIGMA=1E-7" >> INCAR.exx
# INCAR.exact
echo "ALGO=Exact; PREC=Normal; PRECFOCK=Normal" > INCAR.exact
echo "ISMEAR=0; SIGMA=1E-7; NELM=1; LOPTICS=.TRUE.; LASPH=.TRUE." >> INCAR.exact
# INCAR.RPAr
echo "ALGO=ACFDTR; NOMEGA=8; PREC=Normal; PRECFOCK=Normal" > INCAR.RPAr
echo "ISMEAR=0; SIGMA=1E-7; LWAVE=.FALSE." >> INCAR.RPAr
# INCAR.RPA
# echo "ALGO=ACFDT; NOMEGA=8; PREC=Normal; PRECFOCK=Normal" > INCAR.RPA
# echo "ISMEAR=0; SIGMA=1E-7; LWAVE=.FALSE." >> INCAR.RPA

for ENCUT in 400 450 500 550 600 650 700 750 800 850 900 950 1000 1050 1100 1150 1200
do
# DFT
  cp INCAR.DFT INCAR
  echo "ENCUT=${ENCUT}" >> INCAR
  $VASP_GAM
  mv OUTCAR OUTCAR.DFT.${ENCUT}
# exx
  cp INCAR.exx INCAR
  echo "ENCUT=${ENCUT}" >> INCAR
  $VASP_GAM
  mv OUTCAR OUTCAR.exx.${ENCUT}
# NBANDS/ENCUTGW
  NBANDS_=`grep -m 1 "maximum number" OUTCAR.exx.${ENCUT} | cut -c 35- | tr -d " " `
  NBANDS=`echo "$NBANDS_ * 2" | bc -l`
  ENCUTGW=$(echo $ENCUT*2/3 | bc)
# Exact
  cp INCAR.exact INCAR
  echo "ENCUT=${ENCUT}; NBANDS=${NBANDS}" >> INCAR
  $VASP_GAM
  mv OUTCAR OUTCAR.exact.${ENCUT}
# RPAr
  cp INCAR.RPAr INCAR
  echo "ENCUT=${ENCUT}; ENCUTGW=${ENCUTGW}; NBANDS=${NBANDS}" >> INCAR
  $VASP_GAM
  mv OUTCAR OUTCAR.RPAr.${ENCUT}
# RPAr
#  cp INCAR.RPA INCAR
#  echo "ENCUT=${ENCUT}; ENCUTGW=${ENCUTGW}; NBANDS=${NBANDS}" >> INCAR
#  $VASP_GAM
#  mv OUTCAR OUTCAR.RPA.${ENCUT}
done



