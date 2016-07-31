#!/bin/sh


printf "choose a file from the list: \n"

cd mola

ls *.mola

cd ..

printf "> "

read firstarg

filename=${firstarg%%.*}

awk -f awk/quiner_experia_fifrin_node.awk mola/$firstarg


cp wrap/firstpart_experia.txt  "$filename".html

cat essy.txt >> "$filename".html

cat wrap/lastpart.txt >> "$filename".html

rm debug.txt

rm essy.txt