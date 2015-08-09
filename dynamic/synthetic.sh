#!/bin/sh


printf "synthetize a file from the list: \n"

ls *.mol

printf "> "

read firstarg

filename=${firstarg%%.*}

awk -f synthetic.awk $firstarg

