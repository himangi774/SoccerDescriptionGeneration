function main(videono)

videoData_Path = '/lustre/cvit/vijay/DATA/SOCCER/Mexico_Cameroon/';
output_Path = '/lustre/cvit/vijay/Himangi/DPMResults/';
output_Path = '/lustre/cvit/vijay/Himangi/DPMResults/Mexico_Cameroon/';

videofiles = {'part1.mp4','part2.mp4','part3.mp4','part4.mp4','part5.mp4','part6.mp4','part7.mp4','part8.mp4','part9.mp4','part10.mp4', 'part11.mp4', 'part12.mp4', 'part13.mp4'};
demo([videoData_Path videofiles{videono}], output_Path);
%writeToFile([videoData_Path videofiles{videono}]);
%conv([output_Path videofiles{videono}]);


end



