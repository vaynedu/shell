#! /bin/bash

#判断奇偶数字
#input a number, judging the num is  odd or even

read -p "please a number : " n
#n1=$((n%2))


n2=`echo $n | grep -c [^0-9]`

if [ $n2 -eq 1 ]
then
    echo "there is no number"
    exit
fi

n1=$[$n%2]
if [ $n1 -eq 0 ]
then
    echo "odd"
else
    echo "even"
fi
