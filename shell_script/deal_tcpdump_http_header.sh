#! /bin/bash

#利用tcpdump抓取http报文头部
s_512=0
s_512_1k=0
s_1k_2k=0
s_2k_4k=0
s_4k_8k=0
s_8k=0

idx=0

while true
do

   if (($idx >= 50));then
       break
   fi

   #Get tcpdump "tcp[20:2]=0x4745" -i eth0 -nn  -A -c 20 >> aa
   tcpdump "tcp[20:2]=0x4854" -i eth0 -nn  -A -c 1 -q -w tmp_http_header.log.1 > /dev/null 2>&1; cat tmp_http_header.log.1 | sed "s/.*HTTP/HTTP/g" > tmp_http_header.log
   cat tmp_http_header.log >> http_header.log
   #notice ^M CTRL-V Shift-M
   #cat -v
   #sed -n '/HTTP/,/^^M/p' tmp_http_header.log
   sed -i -e 's/^$/vaynedu_test_http/g' tmp_http_header.log
   header_num=`cat tmp_http_header.log | grep  -A100 "HTTP" | grep -m1 -B100  "vaynedu_test_http" | grep -v "vaynedu_test_http" | wc -c `
  # echo $header_num

   if (($header_num < 512));then
       let s_512++
   elif (($header_num < 1024));then
       let s_512_1k++
   elif (($header_num < 2048));then
       let s_1k_2K++
       echo "vaynedu_1k_2k $header_num" >> http_header.log
   elif (($header_num < 4096));then
       let s_2k_4k++
       echo "vaynedu_2k_4k $header_num" >> http_header.log
   elif (($header_num < 8192));then
       let s_4k_8k++
       echo "vaynedu_4k_8k $header_num" >> http_header.log
   else
       let s_8k++
       echo "vaynedu_8k    $header_num" >> http_header.log
   fi

   let idx++
done

>count_result.txt
echo "http header size:"  >> count_result.txt
echo "[0, 512) : $s_512" >> count_result.txt
echo "(512,1k] : $s_512_1k" >> count_result.txt
echo "(1k, 2k] : $s_1k_2k"  >> count_result.txt
echo "(2k, 4k] : $s_2k_4k"  >> count_result.txt
echo "(4k, 8k] : $s_4k_8k"  >> count_result.txt
echo "(8k, ++] : $s_8k"  >> count_result.txt

cat count_result.txt
