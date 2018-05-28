#!/bin/bash
#PBS -S /bin/bash
#PBS -l select=1:ncpus=1:mem=64gb:scratch_local=500gb:ompthreads=1
#PBS -l walltime=333:00:00
#PBS -N hf
#PBS -j oe

trap "clean_scratch" TERM EXIT
OMP_NUM_THREADS=1
MKL_NUM_THREADS=1
ulimit -s unlimited
module load intelcdk-17.1
VASP="/storage/brno2/home/hostiphre/vasp/bin/vasp_gam"

cd $PBS_O_WORKDIR
# INCAR.DFT
echo "ISMEAR=0; SIGMA=1E-7; EDIFF=1E-8" > INCAR.DFT
# INCAR.HF
echo "LHFCALC=.TRUE.; AEXX=1.0; ALDAC=0.0; AGGAC=0.0" > INCAR.HF
echo "ALGO=All" >> INCAR.HF
echo "ISMEAR=0; SIGMA=1E-7; EDIFF=1E-8; HFRCUT=-1; IDIPOL=4" >> INCAR.HF
cp $PBS_O_WORKDIR/* $SCRATCHDIR/

cd $SCRATCHDIR
# DFT
cp INCAR.DFT INCAR
echo "ENCUT=400" >> INCAR
mpirun -n $PBS_NUM_PPN $VASP
mv OUTCAR OUTCAR.DFT.400

for ENCUT in 400 450 500 550 600 650 700 750 800 850 900 950 1000 1050 1100 1150 1200
do
# HF
  cp INCAR.HF INCAR
  echo "ENCUT=${ENCUT}" >> INCAR
  mpirun -n $PBS_NUM_PPN $VASP
  mv OUTCAR OUTCAR.HF.${ENCUT}
done
cp $SCRATCHDIR/OUT* $PBS_O_WORKDIR/
