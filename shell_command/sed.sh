#! /bin/bash

#sed相关用法
#use sed replace some chars
echo "1737 OPPO(OPPO A57)" | sed 's/(.*)//g'
#1737 OPPO


#del ^ space and \t
echo "       talk is cheap, show your code!!" | sed  's/^[ \t]*//g'


#del $ space and \t
echo "talk is cheap, show your code!!                 " | sed  's/[ \t]*$//g'


#

month=03
day=22
>download_suc_file.log

echo "------------------------------------------------------------"
sed -i "s/^2019_${month}_${day}_.*//g" download_suc_file.log
cat download_suc_file.log
echo "------------------------------------------------------------"
sed -i '/^$/d' download_suc_file.log
cat download_suc_file.log

