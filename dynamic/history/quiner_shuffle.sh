#!/bin/sh


printf "choose a file from the list: \n"

cd mol

ls *.mol

cd ..

printf "> "

read firstarg

filename=${firstarg%%.*}

awk -f awk/quiner_shuffle.awk mol/$firstarg


cp wrap/firstpart_experia.txt  "$filename".html

cat essy.txt >> "$filename".html

cat wrap/lastpart.txt >> "$filename".html

rm debug.txt

rm essy.txt


