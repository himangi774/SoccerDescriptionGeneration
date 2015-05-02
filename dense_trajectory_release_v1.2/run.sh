#!/bin/bash
#$ -cwd
#echo ${PATH}
#export PATH="${PATH}:/usr/local/lib"
setenv PATH ${PATH}:/usr/local/lib
#echo ${PATH}
sh /Pulsar3/himangi.s/Soccer/dense_trajectory_release_v1.2/demo.sh
