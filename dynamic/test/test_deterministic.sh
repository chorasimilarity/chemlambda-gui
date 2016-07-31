#!/bin/sh


printf "choose a file from the list: \n"

cd ../mol

ls *.mol

cd ../test

printf "> "

read firstarg

filename=${firstarg%%.*}

awk -f test_deterministic.awk ../mol/$firstarg


cp ../wrap/firstpart.txt  "$filename".html

cat essy.txt >> "$filename".html

cat ../wrap/lastpart.txt >> "$filename".html

