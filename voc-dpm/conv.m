function conv(vidname)


[a, videostring ,videoext] = fileparts(vidname);


istring = ['/global/ffmpeg/bin/ffmpeg -i ' vidname ' -acodec copy -vcodec copy /lustre/cvit/vijay/Himangi/DPMResults/' videostring '.mp4']
system(istring);

