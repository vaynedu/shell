#! /bin/bash

# shell脚本在 []比较的时候， 不要用 > 
# 我就每次运行脚本，都会出现一个=的文件


>2019_03_25_18_30.txt
line_num=`cat 2019_03_25_18_30.txt | wc -l`
echo $line_num

#line_num=10
#if [ "$line_num"  -ge  "100" ]
#if [ "$line_num"  \>  "100" ]
if [ "$line_num"  >=  "100" ]
then
  echo "11111"
else
  echo "22222"
fi




