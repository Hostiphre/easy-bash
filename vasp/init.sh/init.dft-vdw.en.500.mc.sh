#!/bin/bash
#PBS -S /bin/bash
#PBS -l select=8:ncpus=16:mem=250gb:scratch_shared=500gb:cl_alfrid=True
#PBS -l walltime=47:59:59
#PBS -N dft-vdw
#PBS -j oe

trap "clean_scratch" TERM EXIT
OMP_NUM_THREADS=1
MKL_NUM_THREADS=1
ulimit -s unlimited
module load intelcdk-17.1
VASP="/storage/brno2/home/hostiphre/vasp/bin/vasp_gam"

ENCUT=500
cd $PBS_O_WORKDIR
# INCAR.D3
echo "ENCUT=${ENCUT}; ISMEAR=0; SIGMA=1E-7; EDIFF=1E-8; IVDW=11" > INCAR.D3
# INCAR.TS
echo "ENCUT=${ENCUT}; ISMEAR=0; SIGMA=1E-7; EDIFF=1E-8; IVDW=2" > INCAR.TS
# INCAR.MBD
echo "ENCUT=${ENCUT}; ISMEAR=0; SIGMA=1E-7; EDIFF=1E-8; IVDW=202" > INCAR.MBD
cp $PBS_O_WORKDIR/* $SCRATCHDIR/

cd $SCRATCHDIR
for LEN in 10 20 30 40 45 50 55 60
do
# POSCAR
  cp POSCAR.temp POSCAR
  sed -i 's/LEN/${LEN}./g' POSCAR
# DFT-D3
  cp INCAR.D3 INCAR
  mpirun -n $PBS_NUM_PPN $VASP
  mv OUTCAR $PBS_O_WORKDIR/OUTCAR.D3.len.${LEN}
# DFT-TS
  cp INCAR.TS INCAR
  mpirun -n $PBS_NUM_PPN $VASP
  mv OUTCAR $PBS_O_WORKDIR/OUTCAR.D3.len.${LEN}
# DFT-MBD
  cp INCAR.MBD INCAR
  mpirun -n $PBS_NUM_PPN $VASP
  mv OUTCAR $PBS_O_WORKDIR/OUTCAR.D3.len.${LEN}
done

