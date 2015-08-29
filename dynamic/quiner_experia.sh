#!/bin/sh


printf "choose a file from the list: \n"

ls *.mol

printf "> "

read firstarg

filename=${firstarg%%.*}

awk -f quiner_experia.awk $firstarg


cp firstpart_experia.txt  "$filename".html

cat essy.txt >> "$filename".html

cat lastpart.txt >> "$filename".html

