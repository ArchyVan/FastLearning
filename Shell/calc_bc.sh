#!/bin/bash
# calc.sh

i=0;
while [ $i -lt 10000 ]
do
    i=$(echo $i+1|bc)
done
echo $i
