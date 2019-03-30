#! /bin/bash

#shell多进程模板 及其{fd}新特性，

THREADNUM=5

TMPFIFO=/tmp/$$.fifo
fd=$$
echo $fd
[ -e $TMPFIFO ] || mkfifo $TMPFIFO
exec {fd}<>${TMPFIFO}
rm -fr ${TMPFIFO}

for((i=1;i<=$THREADNUM;i++))
do
    echo
done >&${fd}

for i in `seq 1 1000`
do
    sleep 2
    read -u${fd}
    { 
      echo $i
      echo >&${fd}
    }&
done

wait
exec {fd}>&-
