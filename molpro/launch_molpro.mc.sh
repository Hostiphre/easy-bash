#!/bin/bash
#PBS -S /bin/bash
#PBS -l select=1:ncpus=4:mem=192gb:scratch_local=600gb
#PBS -l walltime=333:00:00
#PBS -N job
#PBS -j oe

#trap "clean_scratch" TERM EXIT
ulimit -s unlimited
module add molpro

cd $PBS_O_WORKDIR
cp *.com $SCRATCHDIR/
cd $SCRATCHDIR

for file in `ls`
do
  molpro -t 1 $file
done

cp $SCRATCHDIR/*.out $PBS_O_WORKDIR/

