#! /bin/bash

#删除空格
>testfile.txt
file_name=testfile.txt

echo "delete file 1" >> $file_name
echo "delete file 2" >> $file_name
echo "delete file 3" >> $file_name
echo  >> $file_name
echo "delete file 4" >> $file_name
echo  >> $file_name


#use grep 
echo "use grep"
cat $file_name | grep -v "^$" 

#use sed
echo "use sed"
cat $file_name | sed  '/^$/d'
#sed -i '/^$/'d


#awk
echo "use awk"
cat $file_name | awk '{if($0!="") print $0}'
cat $file_name | awk '{if(length($0)!=0) print $0}'

rm testfile.txt
