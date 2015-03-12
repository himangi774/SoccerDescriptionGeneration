#!/bin/bash

for ((videono=0;videono<15;videono=videono+1))
	do
			echo $videono
			sbatch run.sh $videono+1
			#sleep 60
	done	

