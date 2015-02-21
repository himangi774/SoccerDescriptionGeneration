#!/bin/bash
#SBATCH --job-name=DPM
#SBATCH -A cvit
#SBATCH -n 4
#SBATCH --mem=3950
#SBATCH -p cvit
#SBATCH -t 120:00:00

/scratch/matlab/R2013b/bin/matlab -nodesktop -nosplash -singleCompThread -r "main_vis()"
