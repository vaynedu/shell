#! /bin/bash

y=03
m=17



file_name=global_file_info.txt

#du -c 1.*
ls -l  | grep 2019_${y}_${m}_ |  awk 'BEGIN{size=0;c=0}{size+=$5;c+=1}END{printf "file  num : %d \nfile size : %.2fG\n", c,size/1024/1024/1024}' >> $file_name

echo >> $file_name

find . -type f -name "2019_${y}_${m}_[0-9][0-9]_[0-9][0-9].txt" | xargs wc -l  >> $file_name

echo >> $file_name




#file as
# 2019_03_16_23_00.txt
# 2019_03_16_23_05.txt
# 2019_03_16_23_10.txt
# 2019_03_16_23_15.txt
# 2019_03_16_23_20.txt
# 2019_03_16_23_25.txt
# 2019_03_16_23_30.txt
# 2019_03_16_23_35.txt
# 2019_03_16_23_40.txt
# 2019_03_16_23_45.txt
# 2019_03_16_23_50.txt
# 2019_03_16_23_55.txt



