#! /bin/bash
#$ -S /bin/bash

OMP_NUM_THREADS=1
MKL_NUM_THREADS=1
source /opt/intel/parallel_studio_xe_2015/psxevars.sh
ulimit -s unlimited
VASP="/data/home/ding/vasp/bin/vasp_gam"
WORKDIR="/data/home/ding/400.m1"

ENCUT=400
NPOS=1
cd $WORKDIR
for LEN in 05 10 15 20 25 30 35 40
do
  mkdir -p ${LEN}
  cd ${LEN}
# POSCAR_0
  echo "WATER DIMER" > POSCAR_0
  echo "1." >> POSCAR_0
  echo "${LEN}. 0. 0." >> POSCAR_0
  echo "0. ${LEN}. 0." >> POSCAR_0
  echo "0. 0. ${LEN}." >> POSCAR_0
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
  echo "${LEN}. 0. 0." >> POSCAR_1
  echo "0. ${LEN}. 0." >> POSCAR_1
  echo "0. 0. ${LEN}." >> POSCAR_1
  echo "1 2" >> POSCAR_1
  echo "Cartesian" >> POSCAR_1
  echo " 1.350625   0.111469   0.000000" >> POSCAR_1
  echo " 1.680398  -0.373741  -0.758561" >> POSCAR_1
  echo " 1.680398  -0.373741   0.758561" >> POSCAR_1
  echo "" >> POSCAR_1
# POSCAR_2
  echo "WATER DIMER" > POSCAR_2
  echo "1." >> POSCAR_2
  echo "${LEN}. 0. 0." >> POSCAR_2
  echo "0. ${LEN}. 0." >> POSCAR_2
  echo "0. 0. ${LEN}." >> POSCAR_2
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
  cp $WORKDIR/POTCAR .
  cp $WORKDIR/KPOINTS .
# INCAR.DIPOL
  echo "ENCUT=${ENCUT}; IDIPOL=4" > INCAR.DIPOL
  echo "LHFCALC=.TRUE.; AEXX=1.0; ALDAC=0.0; AGGAC=0.0" >> INCAR.DIPOL
  echo "PREC=Accurate; PRECFOCK=Accurate" >> INCAR.DIPOL
  echo "ALGO=All; LMAXFOCKAE=-1; LASPH=.TRUE." >> INCAR.DIPOL
# INCAR.DIPOLCUT
  echo "ENCUT=${ENCUT}; IDIPOL=4; HFRCUT=-1" > INCAR.DIPOLCUT
  echo "LHFCALC=.TRUE.; AEXX=1.0; ALDAC=0.0; AGGAC=0.0" >> INCAR.DIPOLCUT
  echo "PREC=Accurate; PRECFOCK=Accurate" >> INCAR.DIPOLCUT
  echo "ALGO=All; LMAXFOCKAE=-1; LASPH=.TRUE." >> INCAR.DIPOLCUT

  cd $WORKDIR
done

for DIR in `ls -d */` 
do
  cd $WORKDIR/$DIR/
# DIPOL
  mv INCAR.DIPOL INCAR
  mpirun -n 8 $VASP
  mv OUTCAR OUTCAR.DIPOL
# DIPOLCUT
  mv INCAR.DIPOLCUT INCAR
  mpirun -n 8 $VASP
  mv OUTCAR OUTCAR.DIPOLCUT

done

