function main(videono)

videoData_Path = '/lustre/cvit/vijay/DATA/SOCCER/Spain_Netherlands/';
output_Path = '/lustre/cvit/vijay/Himangi/DPMResults/';
output_Path = '/lustre/cvit/vijay/Himangi/DPMResults/Spain_Netherlands/';

videofiles = {'part1.mp4','part2.mp4','part3.mp4','part4.mp4','part5.mp4','part6.mp4','part7.mp4','part8.mp4','part9.mp4','part10.mp4'};
writeToFile([videoData_Path videofiles{videono}]);
%writeToFile([videoData_Path videofiles{videono}]);
%conv([output_Path videofiles{videono}]);


end



