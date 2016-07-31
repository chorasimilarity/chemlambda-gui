#!/bin/sh


printf "synthetize a file from the list: \n"

cd mol

ls *.mol

cd ..

printf "> "

read firstarg

filename=${firstarg%%.*}

awk -f awk/synthetic.awk mol/$firstarg

mv synt.mol mol/synt.mol

