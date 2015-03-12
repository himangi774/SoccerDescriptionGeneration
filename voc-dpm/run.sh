#!/bin/bash
#SBATCH --job-name=DPM
#SBATCH -A cvit
#SBATCH -n 4
#SBATCH --mem=3950
#SBATCH -p cvit
#SBATCH -t 120:00:00

LD_PRELOAD=/usr/lib/gcc/x86_64-redhat-linux/4.4.6/libstdc++.so /scratch/matlab/R2011a/bin/matlab -nodesktop -nosplash -singleCompThread -r "main($1)"
