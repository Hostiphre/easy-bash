#!/bin/bash
#PBS -S /bin/bash
#PBS -l select=1:ncpus=4:mem=80gb:scratch_local=500gb:ompthreads=1
#PBS -l walltime=48:00:00
#PBS -N job
#PBS -j oe

trap "clean_scratch" TERM EXIT
OMP_NUM_THREADS=1
MKL_NUM_THREADS=1
ulimit -s unlimited
module load intelcdk-17.1
VASP="/storage/brno2/home/hostiphre/vasp-knl-master/bin/vasp_std"

cd $PBS_O_WORKDIR
for KSP in 0.5 0.4 0.3 0.25 0.20 0.15 0.10 0.05
do
  mkdir -p kspacing_${KSP}
  cd kspacing_${KSP}
# POTCAR/POSCAR/INCAR
  cp $PBS_O_WORKDIR/POTCAR .
  cp $PBS_O_WORKDIR/POSCAR .
  cp $PBS_O_WORKDIR/INCAR .
# KPOINTS
  echo "KSPACING=${KSP}" >> INCAR
  cd $PBS_O_WORKDIR
done

for DIR in `ls -d ksp*/` 
do
  cp $PBS_O_WORKDIR/$DIR/* $SCRATCHDIR/
  cd $SCRATCHDIR
  mpirun -n $PBS_NUM_PPN $VASP
  rm WAVE* CHG*
  cp $SCRATCHDIR/* $PBS_O_WORKDIR/$DIR/
  rm $SCRATCHDIR/*
done

