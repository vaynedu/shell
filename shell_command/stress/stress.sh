#stress（Linux系统压力测试工具）和sysstat（Linux性能工具）

#用rpm方式安装，先从下面的地址下载rpm包
#http://ftp.tu-chemnitz.de/pub/linux/dag/redhat/el7/en/x86_64/rpmforge/RPMS/stress-1.0.2-1.el7.rf.x86_64.rpm
#然后 rpm -Uvh stress-1.0.2-1.el7.rf.x86_64.rpm 安装
#sysstat使用yum安装 yum install sysstat


# 压测cpu
stress --cpu 1 --timeout 100

# 压测io
stress -i 1 --timeout 100

# 等待调度进程
stress -c 8 --timeout 100

