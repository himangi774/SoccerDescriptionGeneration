%function demo(vidname, outfolder)
function demo(vidname)

%vidname = '/lustre/cvit/vijay/DATA/SOCCER/part10.mp4';
outfolder = '/lustre/cvit/vijay/Himangi/DPMResults/';

[a, videostring ,videoext] = fileparts(vidname);

x1 = [outfolder videostring '_time.txt']

fileID = fopen([outfolder videostring '_time.txt'], 'r');

vidno  = 7;

tline = fgetl(fileID);
while ischar(tline)   
    outPath = [outfolder];
    A = regexp(tline,'\s+','split');
    A(1)
    tline = fgetl(fileID);
    %disp(A)
    if (strcmp(A(1), '0'))
        outPath = [outPath 'walk/'];
    end
    if(strcmp(A(1), '1'))
        outPath =  [outPath 'kick/'];
    end
    if (strcmp(A(1), '2'))
        outPath = [outPath 'run/'];
    end
    if(strcmp(A(1), '3'))
        outPath =  [outPath 'fall/'];
    end
    if (strcmp(A(1), '4'))
        outPath = [outPath 'dribble/'];
    end
    if(strcmp(A(1), '5'))
        outPath =  [outPath 'goalkeeper/'];
    end
    if (strcmp(A(1), '6'))
        outPath = [outPath 'hand_kick/'];
    end
    if(strcmp(A(1), '7'))
        outPath =  [outPath 'throw/'];
    end

    out_vid_name = sprintf('vid%d.mp4', vidno);
    vidno = vidno + 1;
    outname = [outPath out_vid_name];
    i1 = ['/global/ffmpeg/bin/ffmpeg -i ' vidname ' -strict experimental -ss ']
         a  = char(A(1))
         b = char(A(2))
         c = char(A(3))
        i2 = [b ' -t ' c]
        i3 = [' -codec copy -copyinkf ' outname ]
        istring = [i1 i2 i3]
    system(istring);
    
  
end
fclose(fileID);
