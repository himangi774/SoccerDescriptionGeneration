#!/bin/bash
#$ -cwd
#setenv PATH ${PATH}:/usr/local/lib
echo $PATH;
directory="/Pulsar3/himangi.s/Soccer/Actions" ;
out_dir="/Pulsar3/himangi.s/Soccer";
START=46;
END=47;

for i in $(seq $START $END);
do
	filename="vid$i.mp4"
	echo $filename
	filePath=`find $directory -iname $filename`
	echo $filePath
	basePath=`dirname $filePath`
	outfile="features$i"
	outPath="$basePath/$outfile"
	echo $outPath
	/Pulsar3/himangi.s/Soccer/dense_trajectory_release_v1.2/release/DenseTrack $filePath > $outPath
done
