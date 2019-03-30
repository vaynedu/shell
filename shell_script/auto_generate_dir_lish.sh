#! /bin/bash

#自动生成该目录下的文件信息
>./README.md
echo -e "\n\n常用shell脚本" >> ./README.md
echo "====" >> ./README.md
echo -e "auto_update and last_modify: `date "+%Y-%m-%d %H:%M:%S"`" >> ./README.md
echo "-------" >> ./README.md


cnt=1

file_list=`ls -l | awk '{print $9}'`
for file in $file_list
do
      [ "$file"x == "README.md"x ]      && continue
      [ "$file"x == "ChangeLog.txt"x ]  && continue
               
      echo "## [$cnt.$file](https://github.com/lotluck/shell/blob/master/shell_script/$file)" >> ./README.md         
      if [ -d "$file" ]
      then
         echo ">> 目录文件请在里面查看" >> ./README.md
      else
         echo ">> `sed -n '3p' $file | awk -F '#' '{print $2}'`" >> ./README.md
      fi
      let cnt++
done

echo -e "\n\n\n"  >> ./README.md
