#!/bin/sh


bitin0=( ' in 2 1\n' ' 1 in 2\n' ' 1 2 con\n' ' in 2 1\n' ' 1 in 2\n' ' 2 1 con\n' )

bitin1=( ' 1 con 2\n' ' 2 1 con\n' ' in 1 2\n' ' 1 2 con\n' ' 2 con 1\n' ' in 1 2\n' )

bitout0=( ' con 22 12\n' ' 12 con 22\n' ' 12 22 out\n' ' con 22 12\n' ' 12 con 22\n' ' 22 12 out\n' )

bitout1=( ' 12 out 22\n' ' 22 12 out\n' ' con 12 22\n' ' 12 22 out\n' ' 22 out 12\n' ' con 12 22\n' )

alfa=( 'A' 'FI' )


beta=( 'L' 'FO' 'FOE' )

for ((i=0; i<=1; i++))
do

for ((j=0; j<=2; j++))
do

for ((k=0; k<=1; k++))
do

for ((l=0; l<=2; l++))
do

vali=${alfa[$i]} 

valj=${beta[$j]}

valk=${alfa[$k]}

vall=${beta[$l]}

valtot="_"$vali"_"$valj"_"$valk"_"$vall


for ((a=0; a<=5; a++))
do


for ((b=0; b<=5; b++))
do

filename=$a"_"$b"_"$valtot".mol"

valbitin0=${bitin0[$a]}

valbitin1=${bitin1[$a]}

valbitout0=${bitout0[$b]}

valbitout1=${bitout1[$b]}

vmulout='MULOUT out bubu\n MULIN bubu in'

gugu=$vali$valbitin0$valj$valbitin1$valk$valbitout0$vall$valbitout1$vmulout

echo -e $gugu > $filename

awk -f foe_bubbles_bit_exp.awk $filename


printf "$filename" >> data.txt

printf "\n" >> data.txt

for ((aa=1; aa<=7; aa++))
do

printf " " > temp_added_nodes

printf " " > temp_trashed_nodes

awk -f foe_bubbles_bit_exp.awk temp_final_nodes


add_nodes=`wc -l temp_added_nodes | awk '{print $1'}`

trash_nodes=`wc -l temp_trashed_nodes | awk '{print $1'}`

no_nodes=`wc -l temp_final_nodes | awk '{print $1'}`

cat temp_for_count >> data.txt 

printf "\n" >> data.txt

rm temp_added_nodes

rm temp_trashed_nodes

done

rm $filename

printf "\n" >> data.txt



rm temp_*



done

done

done

done

done

done
