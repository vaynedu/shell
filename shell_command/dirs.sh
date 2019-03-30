#! /bin/bash

#当在linux频繁切换目录的时候，可以用此dirs、pushd、popd命令
dirs -v
#0  /data1/shell/shell_command

#push dir to stack and switch current dir
echo "--------------------pushd-----------------------"
pushd /data1/shell
pwd
pushd /data1/shell/shell_script
pwd
pushd /data1/shell/shell_script
pwd
dirs -v


pushd +2
pushd -1

dirs -v

#/data1/shell /data1/shell/shell_command
#/data1/shell
#/data1/shell/shell_script /data1/shell /data1/shell/shell_command
#/data1/shell/shell_script
#/data1/shell/shell_script /data1/shell/shell_script /data1/shell /data1/shell/shell_command
#/data1/shell/shell_script
# 0  /data1/shell/shell_script
# 1  /data1/shell/shell_script
# 2  /data1/shell
# 3  /data1/shell/shell_command
#/data1/shell /data1/shell/shell_command /data1/shell/shell_script /data1/shell/shell_script
#/data1/shell/shell_script /data1/shell/shell_script /data1/shell /data1/shell/shell_command
# 0  /data1/shell/shell_script
# 1  /data1/shell/shell_script
# 2  /data1/shell
# 3  /data1/shell/shell_command


#pop dir to stach
echo "----------------------popd-------------------------"

popd 

popd +1

dirs -v
#/data1/shell/shell_script /data1/shell /data1/shell/shell_command
#/data1/shell/shell_script /data1/shell/shell_command
# 0  /data1/shell/shell_script
# 1  /data1/shell/shell_command

