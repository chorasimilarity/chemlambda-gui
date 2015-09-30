#!/bin/sh


printf "choose a file from the list: \n"

ls *.mola

printf "> "

read firstarg

filename=${firstarg%%.*}

awk -f quiner_experia_fifrin_node.awk $firstarg


cp firstpart_experia.txt  "$filename".html

cat essy.txt >> "$filename".html

cat lastpart.txt >> "$filename".html

