#!/bin/bash
#PBS -S /bin/bash
#PBS -l select=1:ncpus=4:mem=64gb:scratch_local=500gb:ompthreads=1
#PBS -l walltime=333:00:00
#PBS -N dft-vdw
#PBS -j oe

trap "clean_scratch" TERM EXIT
OMP_NUM_THREADS=1
MKL_NUM_THREADS=1
ulimit -s unlimited
module load intelcdk-17.1
VASP="/storage/brno2/home/hostiphre/vasp/bin/vasp_gam"

cd $PBS_O_WORKDIR
# INCAR.D3
echo "ISMEAR=0; SIGMA=1E-7; EDIFF=1E-8; IVDW=11" > INCAR.D3
# INCAR.TS
echo "ISMEAR=0; SIGMA=1E-7; EDIFF=1E-8; IVDW=2" > INCAR.TS
# INCAR.MBD
echo "ISMEAR=0; SIGMA=1E-7; EDIFF=1E-8; IVDW=202" > INCAR.MBD
cp $PBS_O_WORKDIR/* $SCRATCHDIR/

cd $SCRATCHDIR
for ENCUT in 400 450 500 550 600 650 700 750 800 850 900 950 1000 1050 1100 1150 1200
do
# DFT-D3
  cp INCAR.D3 INCAR
  echo "ENCUT=${ENCUT}" >> INCAR
  mpirun -n $PBS_NUM_PPN $VASP
  mv OUTCAR OUTCAR.D3.${ENCUT}
# DFT-TS
  cp INCAR.TS INCAR
  echo "ENCUT=${ENCUT}" >> INCAR
  mpirun -n $PBS_NUM_PPN $VASP
  mv OUTCAR OUTCAR.TS.${ENCUT}
# DFT-MBD
  cp INCAR.MBD INCAR
  echo "ENCUT=${ENCUT}" >> INCAR
  mpirun -n $PBS_NUM_PPN $VASP
  mv OUTCAR OUTCAR.MBD.${ENCUT}
done
cp $SCRATCHDIR/OUT* $PBS_O_WORKDIR/
