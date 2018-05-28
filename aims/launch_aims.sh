#!/bin/bash
#PBS -S /bin/bash
#PBS -l select=1:ncpus=1:mem=16gb:scratch_local=16gb:ompthreads=1
#PBS -l walltime=0:30:00
#PBS -N job
#PBS -j oe

trap "clean_scratch" TERM EXIT
OMP_NUM_THREADS=1
MKL_NUM_THREADS=1
ulimit -s unlimited
module load intelcdk-17.1
AIMS="/storage/brno2/home/hostiphre/fhi-aims.170329/bin/aims.170329.scalapack.mpi.x"

cp $PBS_O_WORKDIR/$DIR/* $SCRATCHDIR/
cd $SCRATCHDIR
$AIMS | tee output
cp $SCRATCHDIR/* $PBS_O_WORKDIR/$DIR/
rm $SCRATCHDIR/*

