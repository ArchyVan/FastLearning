#!/bin/bash
# gettopfamily.sh

[ $# -lt 1] && echo "please input the income file" && exit -1
[ ! -f $1 ] && echo "$1 is not a file" && exit -1

income=$1
awk '{
    print("%d %0.2fn",$1,$3/$2);
}' $income | sort -k 2 -n -r
