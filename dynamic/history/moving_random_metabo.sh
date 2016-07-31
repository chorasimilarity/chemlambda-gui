#!/bin/sh


printf "choose a file from the list: \n"

cd mol

ls *.mol

cd ..

printf "> "

read firstarg

filename=${firstarg%%.*}

awk -f awk/check_1_mov2_rand_metabo.awk mol/$firstarg


cp wrap/firstpart.txt  "$filename".html

cat essy.txt >> "$filename".html

cat wrap/lastpart.txt >> "$filename".html

rm essy.txt