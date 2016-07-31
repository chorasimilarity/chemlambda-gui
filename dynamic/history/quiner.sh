#!/bin/sh


printf "choose a file from the list: \n"

ls *.mol

printf "> "

read firstarg

filename=${firstarg%%.*}

awk -f quiner.awk $firstarg


cp firstpart_q.txt  "$filename".html

cat essy.txt >> "$filename".html

cat lastpart.txt >> "$filename".html

