#!/bin/sh

printf "choose a file from the list: \n "

ls *.mol

printf "> "

read firstarg

filename=${firstarg%%.*}

awk -f space_check_1_foe.awk $firstarg

awk -f foe_bubbles_06_10.awk $firstarg

cp graph_before.json "$filename"_0.json

cp graph_before.json file_0.json

b=0

for ((a=1; a <= 10 ; a++))
do

awk -f space_check_1_foe.awk temp_before_comb

let "b++"


cp graph_before.json "$filename"_"$b".json

cp graph_before.json file_"$b".json

let "b++"

awk -f space_check_1_foe.awk temp_final_nodes

cp graph_before.json "$filename"_"$b".json 

cp graph_before.json file_"$b".json

awk -f foe_bubbles_06_10.awk temp_final_nodes
done

cp temp_final_nodes continue.mol

printf "5 reduction steps available, along with intermediary steps, look at them with look.html in your browser" 

printf "\n ... if you want the next 10 steps then: \n    - write again \"bash main_viral.sh\" \n    - choose the file continue.mol from the list \n    - reload look.html in your browser \n"

