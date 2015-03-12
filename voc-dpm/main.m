function main(videono)

videoData_Path = '/lustre/cvit/vijay/DATA/SOCCER/';
output_Path = '/lustre/cvit/vijay/Himangi/DPMResults/';

videofiles = {'part1.mp4','part2.mp4','part3.mp4','part4.mp4','part5.mp4','part6.mp4','part7.mp4','part8.mp4','part9.mp4','part11.mp4','vid1.mkv','vid2.mkv','vid3.mkv','vid4.mkv','vid5.mkv'};
demo([videoData_Path videofiles{videono}], output_Path);

end



