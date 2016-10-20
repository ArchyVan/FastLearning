#!/bin/bash
# calc.sh

i=0;
while [ $i -lt 10000 ]
do
    let i++;
done
echo $i
