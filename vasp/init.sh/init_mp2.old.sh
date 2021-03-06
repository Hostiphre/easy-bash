#!/bin/bash
#PBS -A OPEN-10-11
#PBS -l select=1:ncpus=24:mpiprocs=16:ompthreads=1
#PBS -N wd.mp2.6a
#PBS -j oe

module load MPT/2.12
module load ifort/2015.3.187
module load icc/2015.3.187
module load imkl/11.2.3.187-iimpi-7.3.5
module rm iimpi/7.3.5 impi/5.0.3.048-iccifort-2015.3.187
export MPI_DSM_CPULIST=0,1,3,4,6,7,9,10,12,13,15,16,18,19,21,22:allhosts
VASP_STD="mpiexec_mpt /home/hostiphre/vasp/vasp_std"
VASP_GAM="mpiexec_mpt /home/hostiphre/vasp/vasp_gam"
export MKL_NUM_THREADS=1
export OMP_NUM_THREADS=1
ulimit -s unlimited
mkdir -p /scratch/work/user/hostiphre/$PBS_JOBID
SCRATCHDIR=/scratch/work/user/hostiphre/$PBS_JOBID

ENCUT=400
ENCUT2=$(echo $ENCUT*1/2 | bc)
ENCUT3=$(echo $ENCUT*2/3 | bc)

cd $PBS_O_WORKDIR
for NPOS in 0 1 2
do
  mkdir ${NPOS}
  cd ${NPOS}
# POSCAR_0
  echo "WATER DIMER" > POSCAR_0
  echo "1." >> POSCAR_0
  echo "6. 0. 0." >> POSCAR_0
  echo "0. 6. 0." >> POSCAR_0
  echo "0. 0. 6." >> POSCAR_0
  echo "2 4" >> POSCAR_0
  echo "Cartesian" >> POSCAR_0
  echo "-1.551007  -0.114520   0.000000" >> POSCAR_0
  echo " 1.350625   0.111469   0.000000" >> POSCAR_0
  echo "-1.934259   0.762503   0.000000" >> POSCAR_0
  echo "-0.599677   0.040712   0.000000" >> POSCAR_0
  echo " 1.680398  -0.373741  -0.758561" >> POSCAR_0
  echo " 1.680398  -0.373741   0.758561" >> POSCAR_0
  echo "" >> POSCAR_0
# POSCAR_1
  echo "WATER DIMER" > POSCAR_1
  echo "1." >> POSCAR_1
  echo "6. 0. 0." >> POSCAR_1
  echo "0. 6. 0." >> POSCAR_1
  echo "0. 0. 6." >> POSCAR_1
  echo "1 2" >> POSCAR_1
  echo "Cartesian" >> POSCAR_1
  echo " 1.350625   0.111469   0.000000" >> POSCAR_1
  echo " 1.680398  -0.373741  -0.758561" >> POSCAR_1
  echo " 1.680398  -0.373741   0.758561" >> POSCAR_1
  echo "" >> POSCAR_1
# POSCAR_2
  echo "WATER DIMER" > POSCAR_2
  echo "1." >> POSCAR_2
  echo "6. 0. 0." >> POSCAR_2
  echo "0. 6. 0." >> POSCAR_2
  echo "0. 0. 6." >> POSCAR_2
  echo "1 2" >> POSCAR_2
  echo "Cartesian" >> POSCAR_2
  echo "-1.551007  -0.114520   0.000000" >> POSCAR_2
  echo "-1.934259   0.762503   0.000000" >> POSCAR_2
  echo "-0.599677   0.040712   0.000000" >> POSCAR_2
  echo "" >> POSCAR_2
# POSCAR
  mv POSCAR_${NPOS} POSCAR
  rm POSCAR_*
# POTCAR/KPOINTS
  cp $PBS_O_WORKDIR/POTCAR .
  cp $PBS_O_WORKDIR/KPOINTS .
# INCAR.DFT
  echo "ENCUT=${ENCUT}" > INCAR
  echo "ISMEAR=0; SIGMA=1E-7; EDIFF=1E-8; LASPH=.TRUE." >> INCAR
# INCAR.HF
  echo "ENCUT=${ENCUT}" > INCAR.HF
  echo "LHFCALC=.TRUE.; AEXX=1.0; ALDAC=0.0; AGGAC=0.0" >> INCAR.HF
  echo "ALGO=A; LMAXFOCKAE=4; LASPH=.TRUE." >> INCAR.HF
  echo "ISMEAR=0; SIGMA=1E-7; EDIFF=1E-8;" >> INCAR.HF
# INCAR.exact
  echo "ENCUT=${ENCUT}" > INCAR.exact
  echo "LHFCALC=.TRUE.; AEXX=1.0; ALDAC=0.0; AGGAC=0.0" >> INCAR.exact
  echo "ALGO=Exact; LMAXFOCKAE=4; LASPH=.TRUE." >> INCAR.exact
  echo "ISMEAR=0; SIGMA=1E-7; NELM=1; LOPTICS=.TRUE." >> INCAR.exact
# INCAR.MP2.2
  echo "ENCUT=${ENCUT}; ENCUTGW=${ENCUT2}" > INCAR.MP2.2
  echo "ALGO=MP2; LMAXFOCKAE=4" >> INCAR.MP2.2
  echo "ISMEAR=0; SIGMA=1E-7" >> INCAR.MP2.2
# INCAR.MP2.3
  echo "ENCUT=${ENCUT}; ENCUTGW=${ENCUT3}" > INCAR.MP2.3
  echo "ALGO=MP2; LMAXFOCKAE=4" >> INCAR.MP2.3
  echo "ISMEAR=0; SIGMA=1E-7" >> INCAR.MP2.3
  cd $PBS_O_WORKDIR
done

for DIR in `ls -d */`
do
  mkdir -p $SCRATCHDIR/$DIR/
  cp $PBS_O_WORKDIR/$DIR/* $SCRATCHDIR/$DIR/
  cd $SCRATCHDIR/$DIR/
# DFT
  $VASP_GAM
  mv OUTCAR OUTCAR.DFT
# HF
  mv INCAR.HF INCAR
  $VASP_GAM
  mv OUTCAR OUTCAR.HF
# NBANDS
  NBANDS_=`grep -m 1 "maximum number" OUTCAR.HF | cut -c 35- | tr -d " " `
  NBANDS=`echo "$NBANDS_ * 2" | bc -l`
# Exact
  cp INCAR.exact INCAR
  echo "NBANDS=${NBANDS}" >> INCAR
  $VASP_GAM
  mv OUTCAR OUTCAR.exact.${NBANDS_}
# MP2.2
  cp INCAR.MP2.2 INCAR
  echo "NBANDS=${NBANDS}" >> INCAR
  $VASP_GAM
  mv OUTCAR OUTCAR.MP2.2.${NBANDS_}
# MP2.3
  cp INCAR.MP2.3 INCAR
  echo "NBANDS=${NBANDS}" >> INCAR
  $VASP_GAM
  mv OUTCAR OUTCAR.MP2.3.${NBANDS_}

  cp $SCRATCHDIR/$DIR/OUT* $PBS_O_WORKDIR/$DIR/
done

