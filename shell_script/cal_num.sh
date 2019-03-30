# /bin/bash 

#shell 脚本常用数学加减乘数计算， awk、expr、python
#shell calculate

int_a=50
int_b=10

let num=$(($int_a-$int_b))
let rdidx=$(($RANDOM % $num))+262144

echo  "$num, $rdidx"

vaynedu_num=10
num=`python -c "print $vaynedu_num*0.2"`
stime=`python -c "print '%d'%($vaynedu_num*0.2)"`
echo $num
echo $stime

