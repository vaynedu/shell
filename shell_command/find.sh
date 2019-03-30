#! /bin/bash

#find常用命令

#only show dirs

find -type d 

ls -l | grep "^d" | awk '{print $9}'

ls -F | grep "/$"

#only show files

find -type f

ls -l | grep "^-" | awk '{print $9}'



# search empty dir and delelte

find -type d -empty | xargs rm -fr {};


#delete designated size files
find . -name "*" -type f size 0c | xargs -n 1 rm -f


# delete file  0.2 day ago
find . -mtime +0.2 -name "*.log.*" -exec rm {} \;



# search file, and list. in fact, grep is better
find . -type f -name "bu_conf_*.conf" | xargs ls
grep -rn "bu_conf_*.conf" bu/



#search file
find . -type f -name "2019_03_17_[0-9][0-9]_[0-9][0-9].txt"

