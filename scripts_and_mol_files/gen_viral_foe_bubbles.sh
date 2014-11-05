#!/bin/sh

printf "choose a file from the list:"

ls *.mol

printf "> "

read firstarg

filename=${firstarg%%.*}

awk -f gen_check_1_foe.awk $firstarg

awk -f foe_bubbles_04_11.awk $firstarg

cp graph_before.json "$filename"_0.json

cp graph_before.json file_0.json



for ((a=1; a <= 20 ; a++))
do
awk -f gen_check_1_foe.awk temp_final_nodes

cp graph_before.json "$filename"_"$a".json 

cp graph_before.json file_"$a".json

awk -f foe_bubbles_04_11.awk temp_final_nodes
done

cp temp_final_nodes continue.mol

printf "10 reduction steps available, look at them with look.html in your browser" 

printf "\n ... if you want the next 10 steps then: \n    - write again \"bash main_viral.sh\" \n    - choose the file continue.mol from the list \n    - reload look.html in your browser \n"

