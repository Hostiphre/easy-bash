#!/bin/bash 
#PBS -S /bin/bash 
#PBS -l select=1:ncpus=4:mem=64gb:scratch_local=250gb:ompthreads=1
#PBS -l walltime=200:00:00
#PBS -N cc.av6z 
#PBS -j oe

trap "clean_scratch" TERM EXIT 
cp $PBS_O_WORKDIR/CC.aV6Z.gjf $SCRATCHDIR/ 
cd $SCRATCHDIR 
OMP_NUM_THREADS=1

ulimit -s unlimited 
module load g09
g09 CC.aV6Z.gjf
cp $SCRATCHDIR/* $PBS_O_WORKDIR 
rm $SCRATCHDIR/* 

