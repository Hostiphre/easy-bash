NBANDS=33000
i=10
j=3
while [ $i -le $NBANDS ]
do
  TASKNUM=$TASKNUM$(echo " ")$i
  i=$(echo "sqrt(10^$j)" | bc)
  ((j++))
done
TASKNUM=$TASKNUM$(echo " ")$NBANDS
echo $TASKNUM
for NN in $TASKNUM
do
  touch $NN.job
done
