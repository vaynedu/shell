#! /bin/bash

# 某个字符连续重复多少次（用在格式对齐）

blank="&emsp;"
file_name="1.auto_generate_dir_lish.sh"
file_name_len=`echo "$file_name" | wc -L`
space_num=`expr 50 - $file_name_len`
echo $space_num
spaces=$(seq -s '&emsp;' $space_num | sed "s/[0-9]//g")
echo $spaces
