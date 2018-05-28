#!/bin/bash
#PBS -S /bin/bash
#PBS -l select=1:ncpus=4:mem=80gb:scratch_local=500gb:ompthreads=1
#PBS -l walltime=24:00:00
#PBS -N job
#PBS -j oe

trap "clean_scratch" TERM EXIT
OMP_NUM_THREADS=1
MKL_NUM_THREADS=1
ulimit -s unlimited
module load intelcdk-17.1
VASP="/storage/brno2/home/hostiphre/vasp-knl-master/bin/vasp_std"

cd $PBS_O_WORKDIR
for ENCUT in 400 500
do
  mkdir -p encut_${ENCUT}
    cd encut_${ENCUT}
  # POSCAR
    echo "WATER DIMER" > POSCAR
    echo "1." >> POSCAR
    echo "25. 0. 0." >> POSCAR
    echo "0. 25. 0." >> POSCAR
    echo "0. 0. 25." >> POSCAR
    echo "2 4" >> POSCAR
    echo "Cartesian" >> POSCAR
    echo "-1.551007  -0.114520   0.000000" >> POSCAR
    echo " 1.350625   0.111469   0.000000" >> POSCAR
    echo "-1.934259   0.762503   0.000000" >> POSCAR
    echo "-0.599677   0.040712   0.000000" >> POSCAR
    echo " 1.680398  -0.373741  -0.758561" >> POSCAR
    echo " 1.680398  -0.373741   0.758561" >> POSCAR
    echo "" >> POSCAR
  # POTCAR/KPOINTS
    cp $PBS_O_WORKDIR/POTCAR .
    cp $PBS_O_WORKDIR/KPOINTS .
  # INCAR
    echo "ENCUT=${ENCUT}" > INCAR
    echo "PREC=Accurate; ISMEAR=0; SIGMA=0; EDIFF=1E-7" >> INCAR
    cd $PBS_O_WORKDIR
  done

for DIR in `ls -d en*/` 
do
  cp $PBS_O_WORKDIR/$DIR/* $SCRATCHDIR/
  cd $SCRATCHDIR
  mpirun -n $PBS_NUM_PPN $VASP
  cp $SCRATCHDIR/* $PBS_O_WORKDIR/$DIR/
  rm $SCRATCHDIR/*
done

