#!/bin/bash
# run with: nohup ./rodar.sh &

export LC_ALL="en_US.UTF-8"
LANG=en_US.UTF-8
for k in $(seq 1 1 10) #repetiçoes
do
#for j in $(seq 0. 0.1 1.5) #gama
#do
	for i in $(seq 4.5 0.1 6.5) #r
	do
	#./a.out $i 0.0 0.0   #> dados_r"$i".dat
	#echo $i $j 
	julia code.jl &
	sleep 1s
	done
#done
done
