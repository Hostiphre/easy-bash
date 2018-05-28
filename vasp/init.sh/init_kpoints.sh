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
for KPOINTS in 5 6 7 # 2 3 4
do
  mkdir -p kpoints_${KPOINTS}
  cd kpoints_${KPOINTS}
# KPOINTS
  echo "Automatic mesh" > KPOINTS
  echo "0" >> KPOINTS
  echo "Monkhorst-pack" >> KPOINTS
  echo "${KPOINTS} ${KPOINTS} ${KPOINTS}" >> KPOINTS
  echo "0. 0. 0." >> KPOINTS
# POTCAR/POSCAR/INCAR
  cp $PBS_O_WORKDIR/POTCAR .
  cp $PBS_O_WORKDIR/POSCAR .
  cp $PBS_O_WORKDIR/INCAR .
  cd $PBS_O_WORKDIR
done

for DIR in `ls -d kpoints*/` 
do
  cp $PBS_O_WORKDIR/$DIR/* $SCRATCHDIR/
  cd $SCRATCHDIR
  mpirun -n $PBS_NUM_PPN $VASP
  rm WAVE* CHG*
  cp $SCRATCHDIR/* $PBS_O_WORKDIR/$DIR/
  rm $SCRATCHDIR/*
done

