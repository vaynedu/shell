#! /bin/bash


#use sed replace some chars
echo "1737 OPPO(OPPO A57)" | sed 's/(.*)//g'
#1737 OPPO


#del ^ space and \t
echo "       talk is cheap, show your code!!" | sed  's/^[ \t]*//g'


#del $ space and \t
echo "talk is cheap, show your code!!                 " | sed  's/[ \t]*$//g'
