#! /bin/bash

#记录awk常用的技巧
#match last char
echo "5.3G" | awk '{n=split($0,a,"");print a[n]}'
echo "5.3M" | awk '{print substr($0,length($0))}'


#cal tatal file size
ls -l | awk 'BEGIN{size=0;c=0}{size+=$5;c+=1}END{printf "file  num : %d \nfile size : %.2fG\n", c,size/1024/1024/1024}'

#
