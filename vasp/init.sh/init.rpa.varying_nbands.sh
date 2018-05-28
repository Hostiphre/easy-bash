#!/bin/bash
#PBS -S /bin/bash
#PBS -l select=1:ncpus=4:mem=64gb:scratch_local=500gb:ompthreads=1
#PBS -l walltime=72:00:00
#PBS -N job
#PBS -j oe

trap "clean_scratch" TERM EXIT
OMP_NUM_THREADS=1
MKL_NUM_THREADS=1
ulimit -s unlimited
module load intelcdk-17.1
VASP="/storage/brno2/home/hostiphre/vasp-knl-master/bin/vasp_std"

LEN=05
ENCUT=400
ENCUTGW=200

cd $PBS_O_WORKDIR
for NPOS in 0 1 2
do
  mkdir ${NPOS}
  cd ${NPOS}
# POSCAR_0
  echo "WATER DIMER" > POSCAR_0
  echo "1." >> POSCAR_0
  echo "${LEN}. 0. 0." >> POSCAR_0
  echo "0. ${LEN}. 0." >> POSCAR_0
  echo "0. 0. ${LEN}." >> POSCAR_0
  echo "2 4" >> POSCAR_0
  echo "Cartesian" >> POSCAR_0
  echo "-1.551007  -0.114520   0.000000" >> POSCAR_0
  echo " 1.350625   0.111469   0.000000" >> POSCAR_0
  echo "-1.934259   0.762503   0.000000" >> POSCAR_0
  echo "-0.599677   0.040712   0.000000" >> POSCAR_0
  echo " 1.680398  -0.373741  -0.758561" >> POSCAR_0
  echo " 1.680398  -0.373741   0.758561" >> POSCAR_0
  echo "" >> POSCAR_0
# POSCAR_1
  echo "WATER DIMER" > POSCAR_1
  echo "1." >> POSCAR_1
  echo "${LEN}. 0. 0." >> POSCAR_1
  echo "0. ${LEN}. 0." >> POSCAR_1
  echo "0. 0. ${LEN}." >> POSCAR_1
  echo "1 2" >> POSCAR_1
  echo "Cartesian" >> POSCAR_1
  echo " 1.350625   0.111469   0.000000" >> POSCAR_1
  echo " 1.680398  -0.373741  -0.758561" >> POSCAR_1
  echo " 1.680398  -0.373741   0.758561" >> POSCAR_1
  echo "" >> POSCAR_1
# POSCAR_2
  echo "WATER DIMER" > POSCAR_2
  echo "1." >> POSCAR_2
  echo "${LEN}. 0. 0." >> POSCAR_2
  echo "0. ${LEN}. 0." >> POSCAR_2
  echo "0. 0. ${LEN}." >> POSCAR_2
  echo "1 2" >> POSCAR_2
  echo "Cartesian" >> POSCAR_2
  echo "-1.551007  -0.114520   0.000000" >> POSCAR_2
  echo "-1.934259   0.762503   0.000000" >> POSCAR_2
  echo "-0.599677   0.040712   0.000000" >> POSCAR_2
  echo "" >> POSCAR_2
# POSCAR
  mv POSCAR_${NPOS} POSCAR
  rm POSCAR_*
# POTCAR/KPOINTS
  cp $PBS_O_WORKDIR/POTCAR .
  cp $PBS_O_WORKDIR/KPOINTS .
# INCAR.DFT
  echo "ENCUT=${ENCUT}" > INCAR
  echo "PREC=Accurate; ISMEAR=0; SIGMA=1E-7; EDIFF=1E-8" >> INCAR
# INCAR.exx
  echo "ENCUT=${ENCUT}; NELM=1; LWAVE=.FALSE." > INCAR.exx
  echo "LHFCALC=.TRUE.; AEXX=1.0; ALDAC=0.0; AGGAC=0.0" >> INCAR.exx
  echo "PREC=Accurate; PRECFOCK=Accurate" >> INCAR.exx
  echo "ALGO=Eigenval; LMAXFOCKAE=4; LASPH=.TRUE." >> INCAR.exx
  echo "ISMEAR=0; SIGMA=1E-7; EDIFF=1E-8;" >> INCAR.exx
# INCAR.exact
  echo "ENCUT=${ENCUT}" > INCAR.exact
  echo "PREC=Accurate; PRECFOCK=Accurate; ALGO=Exact" >> INCAR.exact
  echo "ISMEAR=0; SIGMA=1E-7; NELM=1; LOPTICS=.TRUE." >> INCAR.exact
# INCAR.RPAr
  echo "ENCUT=${ENCUT}; ENCUTGW=${ENCUTGW}" > INCAR.RPAr
  echo "PREC=Accurate; PRECFOCK=Accurate" >> INCAR.RPAr
  echo "ALGO=ACFDTR; NOMEGA=8" >> INCAR.RPAr
  echo "ISMEAR=0; SIGMA=1E-7; LWAVE=.FALSE." >> INCAR.RPAr
# INCAR.RPA
  echo "ENCUT=${ENCUT}; ENCUTGW=${ENCUTGW}" > INCAR.RPA
  echo "PREC=Accurate; PRECFOCK=Accurate" >> INCAR.RPA
  echo "ALGO=ACFDT; NOMEGA=8" >> INCAR.RPA
  echo "ISMEAR=0; SIGMA=1E-7; LWAVE=.FALSE." >> INCAR.RPA

  cd $PBS_O_WORKDIR
done

for DIR in `ls -d */` 
do
  cp $PBS_O_WORKDIR/$DIR/* $SCRATCHDIR/
  cd $SCRATCHDIR
# DFT
  mpirun -n $PBS_NUM_PPN $VASP
  mv OUTCAR OUTCAR.DFT
# Exx
  mv INCAR.exx INCAR
  mpirun -n $PBS_NUM_PPN $VASP
  mv OUTCAR OUTCAR.exx
  mkdir ww
  mv CHG* ww/
  mv W* ww/
# NBANDS
  NBANDS_max=`grep -m 1 "maximum number" OUTCAR.exx | cut -c 35- | tr -d " " `
  i=10
  j=3
  while [ $i -le $NBANDS_max ]
  do
    TASKNUM=$TASKNUM$(echo " ")$i
    i=$(echo "sqrt(10^$j)" | bc)
    ((j++))
  done
  TASKNUM=$TASKNUM$(echo " ")$NBANDS_max
  for NBANDS in $TASKNUM
  do
  # Exact
    cp INCAR.exact INCAR
    cp ww/* .
    echo "NBANDS=${NBANDS}" >> INCAR
    mpirun -n $PBS_NUM_PPN $VASP
    mv OUTCAR OUTCAR.exact.${NBANDS}
  # RPA
    cp INCAR.RPA INCAR
    echo "NBANDS=${NBANDS}" >> INCAR
    mpirun -n $PBS_NUM_PPN $VASP
    mv OUTCAR OUTCAR.RPA.${NBANDS}
  # RPAr
    cp INCAR.RPAr INCAR
    echo "NBANDS=${NBANDS}" >> INCAR
    mpirun -n $PBS_NUM_PPN $VASP
    mv OUTCAR OUTCAR.RPAr.${NBANDS}

  done
  rm -r WAVE* CHG* ww
  cp $SCRATCHDIR/* $PBS_O_WORKDIR/$DIR/
  rm $SCRATCHDIR/*
done

