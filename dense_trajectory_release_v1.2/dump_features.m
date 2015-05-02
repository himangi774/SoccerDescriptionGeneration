videofolder = '/Pulsar3/himangi.s/Soccer/Actions/';

%actions = {'kick' 'run' 'walk' 'fall'}
start_vidno = 274;
end_vidno = 280;

for i = start_vidno : end_vidno
    fileName = sprintf('features%d',i);
    cmd = sprintf('find %s -iname %s',videofolder,fileName);
    [st list] = system(cmd);
    list
    a = dlmread(strtrim(list));
    size(a)
    bb = a(:,41:end);
    size(bb)
    save('/Pulsar3/himangi.s/Soccer/dense_trajectory_release_v1.2/features.mat','bb','-append');
end

