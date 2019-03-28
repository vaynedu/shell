#! /bin/bash

#vmstat(Virtual Memory Statistics 虚拟内存统计) 命令用来显示Linux系统虚拟内存状态，也可以报告关于进程、内存、I/O等系统整体运行状态
vmstat #最大优点就是中断次数和上下文切换次数

#procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
# r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
# 2  0      0 278592 163296 460564    0    0     0     4   10   16  0  0 100  0  0

#进程
#r（Running or Runnable）是就绪队列的长度...
#b（Blocked）则是处于不可中断睡眠状态的进程数



#swap
#si 磁盘写入内存
#so 内存写入磁盘

#system
#cs（context switch）是每秒上下文切换的次数。...
#in（interrupt）则是每秒中断的次数


#cpu
#us 用户进程执行时间百分比(user time)
#sy 内核系统进程执行时间百分比(system time)
#wa IO等待时间百分比
#id 空间时间百分比



# 1s 输出5次
vmstat 1 5


# -t 时间戳 
# -w 对齐显示

