#!/bin/bash
#PBS -A OPEN-12-52
#PBS -l select=4:ncpus=24:mpiprocs=4:ompthreads=1
#PBS -N exx
#PBS -j oe

module load MPT/2.12
module load ifort/2015.3.187
module load icc/2015.3.187
module load imkl/11.2.3.187-iimpi-7.3.5
module rm iimpi/7.3.5 impi/5.0.3.048-iccifort-2015.3.187
export MPI_DSM_CPULIST=0,6,12,18:allhosts
#export MPI_DSM_CPULIST=0,1,3,4,6,7,9,10,12,13,15,16,18,19,21,22:allhosts
VASP_STD="mpiexec_mpt /home/hostiphre/vasp/vasp_std"
VASP_GAM="mpiexec_mpt /home/hostiphre/vasp/vasp_gam"
export MKL_NUM_THREADS=1
export OMP_NUM_THREADS=1
ulimit -s unlimited
mkdir -p /scratch/work/user/hostiphre/$PBS_JOBID
SCRATCHDIR=/scratch/work/user/hostiphre/$PBS_JOBID

cd $PBS_O_WORKDIR
# INCAR.DFT
echo "ISMEAR=0; SIGMA=1E-7; EDIFF=1E-8" > INCAR.DFT
# INCAR.exx
echo "LHFCALC=.TRUE.; AEXX=1.0; ALDAC=0.0; AGGAC=0.0" > INCAR.exx
echo "ALGO=Eigenval; NELM=1; LWAVE=.FALSE.; IDIPOL=4; HFRCUT=-1" >> INCAR.exx
echo "ISMEAR=0; SIGMA=1E-7; EDIFF=1E-8" >> INCAR.exx
cp $PBS_O_WORKDIR/* $SCRATCHDIR/

cd $SCRATCHDIR
for ENCUT in 400 450 500 550 600 650 700 750 800 850 900 950 1000 1050 1100 1150 1200
do
# DFT
  cp INCAR.DFT INCAR
  echo "ENCUT=${ENCUT}" >> INCAR
  $VASP_GAM
  mv OUTCAR OUTCAR.DFT.${ENCUT}
# exx
  cp INCAR.exx INCAR
  echo "ENCUT=${ENCUT}" >> INCAR
  $VASP_GAM
  mv OUTCAR OUTCAR.exx.${ENCUT}
done
cp $SCRATCHDIR/OUT* $PBS_O_WORKDIR/

