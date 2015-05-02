function demo()

videofolder = '/Pulsar3/himangi.s/Soccer/';

actions = {'kick' 'run' 'walk' 'fall'}

for i = 1 : 1%length(actions)
	dir_name = char(strcat( videofolder,actions(i)))
	videos = dir(fullfile(dir_name,'*.mp4'))
    for k=1:1%length(videos)
        vidpath = [dir_name '/' videos(k).name];
        outfile = [videos(k).name '.txt' ];
        prefix = videos(k).name;
        cmd = ['/Pulsar3/himangi.s/Soccer/dense_trajectory_release_v1.2/release/DenseTrack ' vidpath ' > ' outfile];
        system(cmd);
        %cmd2 =  ['split -l 500 ' outfile ' ' prefix];
        %system(cmd2);
        %a = dlmread(outfile);
        %bb = a(:,41:end);
        %save('features.mat','bb');
    end
end

