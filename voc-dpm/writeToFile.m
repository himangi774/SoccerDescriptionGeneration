
function writeToFile(vidname, detection_file_name, outvideo)

% extract frames to scratch 

[a, videostring ,videoext] = fileparts(vidname);
scratch_dir = ['/scratch/frames/' videostring];


if ~exist(scratch_dir)
        system(['mkdir /scratch/frames/']);
        system(['mkdir ' scratch_dir]);
end


istring = ['/global/ffmpeg/bin/ffmpeg -i ' vidname ' -s 1280x716 -qscale:v 2 ' scratch_dir '/%06d.jpg']
system(istring);

img_direcName = [scratch_dir '/'];
%detection_file_name  = ['/lustre/cvit/vijay/Himangi/DPMResults/Spain_Netherlands/' videostring '.txt'];

%writerObj = VideoWriter(['/lustre/cvit/vijay/Himangi/DPMResults/Spain_Netherlands/' videostring  '_out.avi']);
writerObj = VideoWriter(outvideo);
writerObj.FrameRate = 25;
open(writerObj);


fp2 = fopen(detection_file_name,'r');
A=fscanf(fp2,'%ld %f %f %f %f %f'); fclose(fp2);
dets=reshape(A,6,size(A,1)/6)'; 
u_frames = unique(dets(:,1));

for frame_id=1:length(u_frames)
   
    ids = find(dets(:,1)==u_frames(frame_id));	
    fname = sprintf('%06d', u_frames(frame_id))
    im=imread([img_direcName fname '.jpg']);	
    im=insertObjectAnnotation(im,'Rectangle',dets(ids,2:end-1),[dets(ids,end)],'Color',[0 0 255]);
    writeVideo(writerObj,im);
end

close(writerObj);
