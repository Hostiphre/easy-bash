#!/bin/bash 
#PBS -S /bin/bash 
#PBS -l select=1:ncpus=4:mem=64gb:scratch_local=250gb:ompthreads=1
#PBS -l walltime=47:59:59
#PBS -N job 
#PBS -j oe

trap "clean_scratch" TERM EXIT 
cp $PBS_O_WORKDIR/kartoffel.gjf $SCRATCHDIR/ 
cd $SCRATCHDIR 
OMP_NUM_THREADS=1

ulimit -s unlimited 
module load g09
g09 kartoffel.gjf
cp $SCRATCHDIR/* $PBS_O_WORKDIR 
rm $SCRATCHDIR/* 

