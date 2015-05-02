function find_x_y()

videoFolder = '/lustre/cvit/vijay/Himangi/DPMResults/Actions';

 Start = 1;
 End = 10;

for i=Start:End
    cmd = sprintf('find %s -iname vid%d.mp4',videoFolder, i);
    [status,list]=system(cmd);
   
    %VidObj = VideoReader(list);
    cmd = sprintf('/global/ffmpeg/bin/ffmpeg -i %s -vcodec copy -f rawvideo -y /dev/null 2>&1 | tr ^M %c%cn%c | awk %c/^frame=/ {print $2}%c|tail -n 1',strtrim(list), char(39),char(92),char(39),char(39),char(39));
    [status,nFrames] = system(cmd);
    noFrames = str2num(nFrames);
    step = int64(noFrames/10);
    for j=1:step:noFrames
        cmd = sprintf('/global/ffmpeg/bin/ffmpeg -y -i %s -vf "select=gte(n%c,%d)" -vframes 1 out_img.png',strtrim(list),char(92),j);
        st = system(cmd);
        imshow('out_img.png');
        [x y] = ginput(2)
        pause(1);
        %imtool close all
    end
    
end

