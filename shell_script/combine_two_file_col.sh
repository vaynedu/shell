#! /bin/bash


#shell如何实现列合并？


#paste and awk can realize
#can't format print
#paste -d " " 1.txt 2.txt
#awk 'NR==FNR {a[i]=$0;i++} NR>FNR {print a[j]" "$0;j++}'  1.txt 2.txt


#input file
#cat > 1.txt << EOF
#cat > 2.txt << EOF


file_a=$1
file_b=$2

[ -z $file_a ] && echo "please input filename1" && exit
[ -z $file_b ] && echo "please input filename2" && exit

[ ! -f $file_a ] && echo "file is no exist" && exit
[ ! -f $file_b ] && echo "file is no exist" && exit



a_line_num=`cat $file_a | wc -l`
b_line_num=`wc -l $file_b | awk '{print $1}'`

 echo -e "combine file\n$file_a: $a_line_num\n$file_b:$b_line_num\n\n"

idx=1
while true
do
   if (($idx > $a_line_num &&  $idx > $b_line_num ))
   then
       break
   fi  

    line1=`sed -n "$idx"p $file_a`
    line2=`sed -n "$idx"p $file_b`



    #echo "$line1 $line2"

   # printf "%s%s\n" "$line1" "$line2"
    printf "%-40s %s\n" "$line1" "$line2"
   
    let idx++
done

