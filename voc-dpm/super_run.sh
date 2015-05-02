#!/bin/bash

for ((videono=10;videono<13;videono=videono+1))
	do
			echo $videono
			sbatch run.sh $videono+1
			#sleep 60
	done	

