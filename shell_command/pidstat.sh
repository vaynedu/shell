#! /bin/bash

#pistat 统计进程内存、cpu、磁盘相关信息
pidstat

# -p 参数指定某个进程
# -l 让运行的命令完整显示

pidstat -w 5
#查看上下文切换 Report task switching activity  
#[root@ying shell_command]# pidstat -w 5
#Linux 3.10.0-123.el7.x86_64 (ying) 	03/28/2019 	_x86_64_	(1 CPU)

#05:10:46 PM   UID       PID   cswch/s nvcswch/s  Command
#05:10:51 PM     0        10      0.60      0.00  rcu_sched
#05:10:51 PM     0        11      0.40      0.00  rcuos/0
#05:10:51 PM     0       114      0.20      0.00  kworker/u2:2
#05:10:51 PM   998       299      0.20      0.00  lsmd
#05:10:51 PM     0     15208      0.20      0.00  sshd
#05:10:51 PM     0     17862      1.40      0.00  kworker/0:0
#05:10:51 PM     0     17944      0.20      0.00  pidstat


#cswch : 表示每秒自愿上下文切换（voluntary context switches)的次数
#nvcswch : 表示每秒非自愿上下文切换（non voluntary context switches）的次数

#自愿上下文切换，是指进程无法获取所需资源，导致的上下文切比如说， I/O、内存等系统资源不足时，就会发生自愿上下文切换。
#非自愿上下文切换，则是指进程由于时间片已到等原因，被系统强制调度，进而发生的上下文切换。比如说，大量进程都在争抢 CPU 时，就容易发生非自愿上下文切换

pidstat -u 1 2
#查看活跃进程在某个cpu上的使用情况
#root@111.111.111.111:/data1/new_client_log_system/zhengbankuaishou#pidstat -u 1 2   
#Linux 3.10.106-1-tlinux2-0044 (TENCENT64.site) 	03/28/19 	_x86_64_	(32 CPU)
#
#19:55:46      UID       PID    %usr %system  %guest    %CPU   CPU  Command
#19:55:47        0      1944    1.96    0.00    0.00    1.96    11  sap1002
#19:55:47        0      9729   18.63    0.98    0.00   19.61     8  grep
#19:55:47        0      9730   95.10    3.92    0.00   99.02    14  awk
#19:55:47        0      9989    0.00    1.96    0.00    1.96     0  pidstat
#19:55:47        0     12006    0.98    0.00    0.00    0.98     6  nslcd
#19:55:47        0     12563    0.98    0.00    0.00    0.98     6  sap1012
#19:55:47        0     27465    0.00    0.98    0.00    0.98    29  collector
#
#19:55:47      UID       PID    %usr %system  %guest    %CPU   CPU  Command
#19:55:48        0      2533    1.00    1.00    0.00    2.00     7  sap1004
#19:55:48        0      5514   50.00    5.00    0.00   55.00     1  python
#19:55:48        0      9729   15.00    3.00    0.00   18.00     8  grep
#19:55:48        0      9730   94.00    7.00    0.00  101.00    14  awk
#19:55:48        0      9989    1.00    0.00    0.00    1.00     2  pidstat
#
#Average:      UID       PID    %usr %system  %guest    %CPU   CPU  Command
#Average:        0      1944    0.99    0.00    0.00    0.99     -  sap1002
#Average:        0      2533    0.50    0.50    0.00    0.99     -  sap1004
#Average:        0      5514   24.75    2.48    0.00   27.23     -  python
#Average:        0      9729   16.83    1.98    0.00   18.81     -  grep
#Average:        0      9730   94.55    5.45    0.00  100.00     -  awk
#Average:        0      9989    0.50    0.99    0.00    1.49     -  pidstat
#Average:        0     12006    0.50    0.00    0.00    0.50     -  nslcd
#Average:        0     12563    0.50    0.00    0.00    0.50     -  sap1012
#Average:        0     27465    0.00    0.50    0.00    0.50     -  collector



pidstat -d 1 2
#查看某个进程使用读写磁盘情况
#root@111.111.111.111:/data1/new_client_log_system/zhengbankuaishou#pidstat -d 1 2
#Linux 3.10.106-1-tlinux2-0044 (TENCENT64.site) 	03/28/19 	_x86_64_	(32 CPU)
#
#19:57:13      UID       PID   kB_rd/s   kB_wr/s kB_ccwr/s  Command
#19:57:14        0     11165      0.00  27196.08      0.00  curl
#19:57:14        0     20728      0.00      3.92      0.00  sap1007
#
#19:57:14      UID       PID   kB_rd/s   kB_wr/s kB_ccwr/s  Command
#19:57:15        0      3269      0.00     92.00      0.00  kjournald
#19:57:15        0     10469      0.00  56512.00      0.00  sh
#19:57:15        0     11167      0.00  60704.00      0.00  gzip
#19:57:15        0     27468      0.00      4.00      0.00  agent_app
#19:57:15        0     27487      0.00      4.00      0.00  agent_rptd
#
#Average:      UID       PID   kB_rd/s   kB_wr/s kB_ccwr/s  Command
#Average:        0      3269      0.00     45.54      0.00  kjournald
#Average:        0     10469      0.00  27976.24      0.00  sh
#Average:        0     11167      0.00  30051.49      0.00  gzip
#Average:        0     20728      0.00      1.98      0.00  sap1007
#Average:        0     27468      0.00      1.98      0.00  agent_app
#Average:        0     27487      0.00      1.98      0.00  agent_rptd



pidstat -r 1 2
#查看活跃进程的内存使用情况
#Linux 3.10.106-1-tlinux2-0044 (TENCENT64.site) 	03/28/19 	_x86_64_	(32 CPU)
#
#19:59:11      UID       PID  minflt/s  majflt/s     VSZ    RSS   %MEM  Command
#19:59:12        0      5514  19609.90      0.00  283272  66432   0.10  python
#19:59:12        0      5935      3.96      0.00   46244  23516   0.04  sap1008
#19:59:12        0      7809    194.06      0.00  114924   1328   0.00  safe_TsysAgent.
#19:59:12        0     11831     53.47      0.00   10760   1040   0.00  sh
#19:59:12        0     12003   3494.06      0.00  319240  24252   0.04  python
#19:59:12        0     12011    929.70      0.00    8140   1476   0.00  pidstat
#19:59:12        0     12021    329.70      0.00  111008    628   0.00  sleep
#19:59:12        0     12022    315.84      0.00    7420    368   0.00  sleep
#19:59:12        0     12563     12.87      0.00  342280   5836   0.01  sap1012
#19:59:12        0     27468      4.95      0.00  256764   3624   0.01  agent_app
#19:59:12        0     27511      7.92      0.00  277364   1812   0.00  agent_log_rptd
#
#19:59:12      UID       PID  minflt/s  majflt/s     VSZ    RSS   %MEM  Command
#19:59:13        0      2533      1.00      0.00   23672   8208   0.01  sap1004
#19:59:13        0     12003    700.00      0.00  322044  26892   0.04  python
#19:59:13        0     12011    946.00      0.00    8140   1508   0.00  pidstat
#19:59:13        0     12563     12.00      0.00  342280   5836   0.01  sap1012
#19:59:13        0     24754     47.00      0.00   18512   1948   0.00  base
#19:59:13        0     27468      4.00      0.00  256764   3624   0.01  agent_app
#19:59:13        0     27511      1.00      0.00  277364   1812   0.00  agent_log_rptd
#
#Average:      UID       PID  minflt/s  majflt/s     VSZ    RSS   %MEM  Command
#Average:        0      2533      0.50      0.00   23672   8208   0.01  sap1004
#Average:        0      5514   9853.73      0.00  283272  66432   0.10  python
#Average:        0      5935      1.99      0.00   46244  23516   0.04  sap1008
#Average:        0      7809     97.51      0.00  114924   1328   0.00  safe_TsysAgent.
#Average:        0     11831     26.87      0.00   10760   1040   0.00  sh
#Average:        0     12003   2103.98      0.00  320642  25572   0.04  python
#Average:        0     12011    937.81      0.00    8140   1492   0.00  pidstat
#Average:        0     12021    165.67      0.00  111008    628   0.00  sleep
#Average:        0     12022    158.71      0.00    7420    368   0.00  sleep
#Average:        0     12563     12.44      0.00  342280   5836   0.01  sap1012
#Average:        0     24754     23.38      0.00   18512   1948   0.00  base
#Average:        0     27468      4.48      0.00  256764   3624   0.01  agent_app
#Average:        0     27511      4.48      0.00  277364   1812   0.00  agent_log_rptd




#minflt/s: 每秒次缺页错误次数(minor page faults)，次缺页错误次数意即虚拟内存地址映射成物理内存地址产生的page fault次数
#majflt/s: 每秒主缺页错误次数(major page faults)，当虚拟内存地址映射成物理内存地址时，相应的page在swap中，这样的page fault为major page fault，一般在内存使用紧张时产生
