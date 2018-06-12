rm *aV*sh
for job in `ls -d *aV*`
do
  echo "#!/bin/bash" >> ${job}.sh
  echo "#PBS -S /bin/bash" >> ${job}.sh
  echo "#PBS -l select=1:ncpus=4:mem=TAT12gb:scratch_local=TAT13gb" >> ${job}.sh
  echo "#PBS -l walltime=TAT14:00:00" >> ${job}.sh
  echo "#PBS -N job" >> ${job}.sh
  echo "#PBS -j oe" >> ${job}.sh
  echo "trap 'clean_scratch' TERM EXIT" >> ${job}.sh
  echo "ulimit -s unlimited" >> ${job}.sh
  echo "MOLPRO=/storage/brno2/home/hostiphre/molpro/molprop_2015_1_linux_x86_64_i8/bin/molpro" >> ${job}.sh
  echo "cd \$PBS_O_WORKDIR" >> ${job}.sh
  echo "cp $job \$SCRATCHDIR/" >> ${job}.sh
  echo "cd \$SCRATCHDIR" >> ${job}.sh
  echo "\$MOLPRO -t 1 $job" >> ${job}.sh
  echo "cp \$SCRATCHDIR/*.out \$PBS_O_WORKDIR/" >> ${job}.sh
done
sed -i 's/TAT12/64/g' *aVDZ*
sed -i 's/TAT12/96/g' *aVTZ*
sed -i 's/TAT12/160/g' *aVQZ*
sed -i 's/TAT12/192/g' *aV5Z*
sed -i 's/TAT13/500/g' *aVDZ*
sed -i 's/TAT13/500/g' *aVTZ*
sed -i 's/TAT13/600/g' *aVQZ*
sed -i 's/TAT13/600/g' *aV5Z*
sed -i 's/TAT14/20/g' *aVDZ*
sed -i 's/TAT14/20/g' *aVTZ*
sed -i 's/TAT14/333/g' *aVQZ*
sed -i 's/TAT14/333/g' *aV5Z*

