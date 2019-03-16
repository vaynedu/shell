#! /bin/bash

THREADNUM=5

TMPFIFO=/tmp/$$.fifo
[ -e $TMPFIFO ] || mkfifo $TMPFIFO
exec 5 <>${TMPFIFO}
rm -fr ${TMPFIFO}

for((i=1;i<=$THREADNUM;i++))
do
    echo
done >&5

for i in `seq 1 1000`
do
    read -u5
    { 
      echo >&5
    }&
done

wait
exec 5>&-
