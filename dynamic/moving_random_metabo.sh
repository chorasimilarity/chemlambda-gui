#!/bin/sh


printf "choose a file from the list: \n"

ls *.mol

printf "> "

read firstarg

filename=${firstarg%%.*}

awk -f check_1_mov2_rand_metabo.awk $firstarg


cp firstpart.txt  "$filename".html

cat essy.txt >> "$filename".html

cat lastpart.txt >> "$filename".html

