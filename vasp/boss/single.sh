#!/bin/bash
#PBS -A OPEN-7-36
#PBS -N test
#PBS -q qprod
#PBS -l select=16:ncpus=24:mpiprocs=16:ompthreads=1
#PBS -l walltime=12:00:00

module load mpt/2.12
module load ifort/2015.3.187
module load icc/2015.3.187
module load imkl/11.2.3.187-iimpi-7.3.5
module rm iimpi/7.3.5 impi/5.0.3.048-iccifort-2015.3.187
VASP="mpiexec_mpt /home/klimes/src/vasp/gk/mpt_no_shmem/bin/vasp_gam"

cat $PBS_NODEFILE

cd $PBS_O_WORKDIR

mkdir  -p /scratch/work/user/klimes/$PBS_JOBID
SCRATCH=/scratch/work/user/klimes/$PBS_JOBID
INPUT="/home/klimes/molec_crystals/MeOH/dimer/input"

cd $PBS_O_WORKDIR

cp cuts KPOINTS POSCAR POTCAR  $SCRATCH/
cp ${INPUT}/INCAR.dft ${INPUT}/INCAR.HF ${INPUT}/INCAR.exact ${INPUT}/INCAR.MP2 $SCRATCH/

cd $SCRATCH
for len in 13 #9 10 11 12 13
 do
       tail -n +6 POSCAR > POSCAR.tail
       echo "c21" > POSCAR
       echo "1.0000" >> POSCAR
       echo "$len 0.00 0.00" >> POSCAR
       echo "0.00 $len 0.00" >> POSCAR
       echo "0.00 0.00 $len" >> POSCAR
       cat POSCAR.tail >> POSCAR


for icut in 4
 do
  line=`head -n $icut cuts | tail -n 1 `
  encut=`echo $line | awk '{print $1}' `
  encutgw=`echo $line | awk '{print $2}' `
  echo $encut $encutgw

cp INCAR.dft INCAR
echo "ENCUT=$encut" >> INCAR
$VASP
cp OUTCAR OUTCAR.dft.$encut.$len
cp OUTCAR.dft.$encut.$len $PBS_O_WORKDIR/

cp INCAR.HF INCAR
echo "ENCUT=$encut" >> INCAR
$VASP
cp OUTCAR OUTCAR.HF.$encut.$len
cp OUTCAR.HF.$encut.$len $PBS_O_WORKDIR/

NBANDS_=`grep -m 1 "maximum number" OUTCAR | cut -c 35- | tr -d " " `
NBANDS=`echo "$NBANDS_ * 2" | bc -l`

cp INCAR.exact INCAR
echo "ENCUT=$encut" >> INCAR
echo "NBANDS=$NBANDS" >> INCAR
$VASP
cp OUTCAR OUTCAR.diag.$encut.$len

cp INCAR.MP2 INCAR
echo "ENCUT=$encut" >> INCAR
echo "ENCUTGW=$encutgw" >> INCAR
echo "NBANDS=$NBANDS" >> INCAR
$VASP > out.MP2.$encut.$encutgw.$len
cp OUTCAR OUTCAR.MP2.$encut.$encutgw.$len
cp OUTCAR.MP2.$encut.$encutgw.$len $PBS_O_WORKDIR/

  rm WAVECAR WAVEDER CHG*

 done

done

