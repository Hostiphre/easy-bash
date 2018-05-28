#!/bin/bash 
#PBS -S /bin/bash 
#PBS -l select=1:ncpus=4:mem=80gb:scratch_local=500gb:ompthreads=1
#PBS -l walltime=24:00:00 
#PBS -N job 
#PBS -j oe

trap "clean_scratch" TERM EXIT 
cp $PBS_O_WORKDIR/* $SCRATCHDIR/ 
cd $SCRATCHDIR 
OMP_NUM_THREADS=1
MKL_NUM_THREADS=1

ulimit -s unlimited 
module load intelcdk-17.1 
mpirun -n $PBS_NUM_PPN /storage/brno2/home/hostiphre/vasp/bin/vasp_std 
cp $SCRATCHDIR/* $PBS_O_WORKDIR 
rm $SCRATCHDIR/* 

