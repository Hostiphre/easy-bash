#!/bin/bash
#PBS -A OPEN-6-20
#PBS -N rpa_HCHA_bare
#PBS -q qprod
#PBS -l select=4:ncpus=24:mpiprocs=16:ompthreads=1
#PBS -l walltime=26:00:00
#PBS -l place=group=ehc_1d

module load mpt/2.12
module load ifort/2015.3.187
module load icc/2015.3.187
module load imkl/11.2.3.187-iimpi-7.3.5
module rm iimpi/7.3.5 impi/5.0.3.048-iccifort-2015.3.187

VASP="mpiexec_mpt  /home/klimes/src/vasp/gk/mpt_no_shmem/bin/vasp_gam"
export MKL_NUM_THREADS=1

mkdir  -p /scratch/work/user/klimes/$PBS_JOBID
SCRATCH=/scratch/work/user/klimes/$PBS_JOBID

cd $PBS_O_WORKDIR

cp cuts KPOINTS POSCAR POTCAR INCAR.*  $SCRATCH/

cd $SCRATCH

for icut in 1 2 3 #4 5 #1 2 3 4 #5 6 7
 do
  line=`head -n $icut cuts | tail -n 1 `
  encut=`echo $line | awk '{print $1}' `
  encutgw=`echo $line | awk '{print $2}' `
#  encut=400
#  encutgw=100
  echo $encut $encutgw

cp INCAR.dft INCAR
echo "ENCUT=$encut" >> INCAR
$VASP
cp OUTCAR OUTCAR.dft.$encut
cp OUTCAR.dft.$encut $PBS_O_WORKDIR/

cp INCAR.exx INCAR
echo "ENCUT=$encut" >> INCAR
$VASP
cp OUTCAR OUTCAR.EXX.$encut
cp OUTCAR.EXX.$encut $PBS_O_WORKDIR/

NBANDS_=`grep -m 1 "maximum number" OUTCAR | cut -c 35- | tr -d " " `
NBANDS=`echo "$NBANDS_ * 2" | bc -l`

cp INCAR.exact INCAR
echo "ENCUT=$encut" >> INCAR
echo "NBANDS=$NBANDS" >> INCAR
$VASP
cp OUTCAR OUTCAR.diag.$encut

cp INCAR.rpar INCAR
echo "ENCUT=$encut" >> INCAR
echo "ENCUTGW=$encutgw" >> INCAR
echo "NBANDS=$NBANDS" >> INCAR
$VASP > out.$encut.$encutgw
cp OUTCAR OUTCAR.$encut.$encutgw
cp OUTCAR.$encut.$encutgw $PBS_O_WORKDIR/

cp INCAR.GW INCAR
echo "ENCUT=$encut" >> INCAR
echo "ENCUTGW=$encutgw" >> INCAR
echo "NBANDS=$NBANDS" >> INCAR
$VASP > out.RGW.$encut.$encutgw
cp OUTCAR OUTCAR.RGW.$encut.$encutgw
cp OUTCAR.RGW.$encut.$encutgw $PBS_O_WORKDIR/

  rm WAVECAR WAVEDER CHG*
 done

cp $SCRATCH/* $PBS_O_WORKDIR

