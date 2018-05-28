for file in MP2*/*/OU*.old*
do target=`echo $file|sed 's/.old//'`
  if [ ! -e $target ]
    then mv $file $target
  fi
done

