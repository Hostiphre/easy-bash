#!/bin/bash
#PBS -S /bin/bash
#PBS -l select=8:ncpus=16:mem=250gb:scratch_shared=500gb:cl_alfrid=True
#PBS -l walltime=47:59:59
#PBS -N rpa.en
#PBS -j oe

trap "clean_scratch" TERM EXIT
OMP_NUM_THREADS=1
MKL_NUM_THREADS=1
ulimit -s unlimited
module load intelcdk-17.1
VASP="/storage/brno2/home/hostiphre/vasp/bin/vasp_gam"

ENCUT=500
ENCUTGW=$(echo ${ENCUT}*2/3 | bc)
cd $PBS_O_WORKDIR
# INCAR.DFT
echo "ENCUT=${ENCUT}; ISMEAR=0; SIGMA=1E-7; EDIFF=1E-8; PREC=Normal; IDIPOL=4" > INCAR.DFT
# INCAR.exx
echo "ENCUT=${ENCUT}; PREC=Normal; PRECFOCK=Normal; NELM=1; LWAVE=.FALSE." > INCAR.exx
echo "LHFCALC=.TRUE.; AEXX=1.0; ALDAC=0.0; AGGAC=0.0" >> INCAR.exx
echo "ALGO=Eigenval; LMAXFOCKAE=4" >> INCAR.exx
echo "ISMEAR=0; SIGMA=1E-7" >> INCAR.exx
# INCAR.exact
echo "ENCUT=${ENCUT}; ALGO=Exact; PREC=Normal; PRECFOCK=Normal" > INCAR.exact
echo "ISMEAR=0; SIGMA=1E-7; NELM=1; LOPTICS=.TRUE." >> INCAR.exact
# INCAR.RPAr
echo "ENCUT=${ENCUT}; ENCUTGW=${ENCUTGW}; ALGO=ACFDTR; NOMEGA=8; PREC=Normal; PRECFOCK=Normal" > INCAR.RPAr
echo "ISMEAR=0; SIGMA=1E-7; LWAVE=.FALSE." >> INCAR.RPAr
# INCAR.single
echo "ENCUT=${ENCUT}; ENCUTGW=${ENCUTGW}; ALGO=GW0R; NOMEGA=8; NATURALO=12; PREC=Normal; PRECFOCK=Normal" > INCAR.single
echo "ISMEAR=0; SIGMA=1E-7; LWAVE=.FALSE." >> INCAR.single
cp $PBS_O_WORKDIR/* $SCRATCHDIR/

cd $SCRATCHDIR
for LEN in 9 10 11 12
do
# POSCAR
  cp POSCAR.temp POSCAR
  LEN1=${LEN}
  LEN2=$(echo ${LEN}+1 | bc)
  LEN3=$(echo ${LEN}+2 | bc)
  echo "sed -i 's/^LEN 0. 0./${LEN1}. 0. 0./g' POSCAR" | sh
  echo "sed -i 's/^0. LEN 0./0. ${LEN2}. 0./g' POSCAR" | sh
  echo "sed -i 's/^0. 0. LEN/0. 0. ${LEN3}./g' POSCAR" | sh
# DFT
  cp INCAR.DFT INCAR
  mpirun -n $PBS_NUM_PPN $VASP
  mv OUTCAR OUTCAR.DFT.len.${LEN}
# exx
  cp INCAR.exx INCAR
  mpirun -n $PBS_NUM_PPN $VASP
  mv OUTCAR OUTCAR.exx.len.${LEN}
# NBANDS
  NBANDS_=`grep -m 1 "maximum number" OUTCAR.exx.len.${LEN} | cut -c 35- | tr -d " " `
  NBANDS=`echo "$NBANDS_ * 2" | bc -l`
# Exact
  cp INCAR.exact INCAR
  echo "NBANDS=${NBANDS}" >> INCAR
  mpirun -n $PBS_NUM_PPN $VASP
  mv OUTCAR OUTCAR.exact.len.${LEN}
# RPAr
  cp INCAR.RPAr INCAR
  echo "NBANDS=${NBANDS}" >> INCAR
  mpirun -n $PBS_NUM_PPN $VASP
  mv OUTCAR OUTCAR.RPAr.len.${LEN}
# Single
  cp INCAR.single INCAR
  echo "NBANDS=${NBANDS}" >> INCAR
  mpirun -n $PBS_NUM_PPN $VASP
  mv OUTCAR OUTCAR.single.len.${LEN}
# OUTCAR
  cp $SCRATCHDIR/OUT*${LEN} $PBS_O_WORKDIR/
  rm $SCRATCHDIR/WAVE* $SCRATCHDIR/CHG* 
done
