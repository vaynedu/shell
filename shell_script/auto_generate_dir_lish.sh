#! /bin/bash


declare -A  map=([1]="一、" [2]="二、" [3]="三、" [4]="四、" [5]="五、"
                 [6]="六、" [7]="七、" [8]="八、" [9]="九、" [10]="十、")

>./README.md
echo -e "\n\nwelcome to file lists" >> ./README.md
echo "====" >> ./README.md
echo -e "auto_update and last_modify: `date "+%Y-%m-%d %H:%M:%S"`" >> ./README.md
echo "-------" >> ./README.md

dir_list=`ls -l | grep '^d' | awk '{print $9}'`

idx=1
cnt=1
for dir in $dir_list
do  
    echo "## ${map[$idx]}$dir<br>" >> ./README.md

    file_list=`ls -l  $dir | awk '{print $9}'`
    for file in $file_list
    do
          echo ">> ####    $cnt.$file" >> ./README.md
          let cnt++
    done

    echo -e "\n\n\n"  >> ./README.md

    let idx++
    let cnt=1
done

