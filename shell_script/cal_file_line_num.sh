#! /bin/bash

#多进程统计文件行数（当文件比较大的时候，IO会成为瓶颈）

THREADNUM=16

TMPFIFO=/tmp/$$.fifo
[ -e $TMPFIFO ] || mkfifo $TMPFIFO
exec 16<>${TMPFIFO}
rm -fr ${TMPFIFO}

for((i=1;i<=$THREADNUM;i++))
do
    echo
done >&16


month=03
day=22



file_name_list=`ls -l | awk '{print $9}' | grep "2019_${month}_${day}_"  | grep -E "^2019_[0-9]{2}_[0-9]{2}_[0-9]{2}_[0-9]{2}.txt"`

for i in $file_name_list
do
    read -u16
    {
      wc -l $i >> tmp.cal.txt
      echo >&16
    }&
done

wait
exec 16>&-

