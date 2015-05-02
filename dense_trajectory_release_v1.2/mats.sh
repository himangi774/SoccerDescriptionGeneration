#!/bin/bash
#$ -cwd -q all.q@node3 -l vf=32G 
matlab -nojvm -nosplash -nodisplay -r $1 
