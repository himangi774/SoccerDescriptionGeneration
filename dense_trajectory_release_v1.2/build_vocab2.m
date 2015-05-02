addpath('/Pulsar3/himangi.s/vlfeat-0.9.20/toolbox/'); vl_setup;
videofolder = '/Pulsar3/himangi.s/Soccer/Actions/';

%actions = {'kick' 'run' 'walk' 'fall'}
start_vidno = 1; end_vidno = 280;

num_total_feas = 1050000; feas = single(zeros(397, num_total_feas));
numFeasPerImg = 3750; %ceil( num_total_feas/280);

for i = start_vidno : end_vidno
    fileName = sprintf('features%d',i)
    cmd = sprintf('find %s -iname %s',videofolder,fileName);
    [st list] = system(cmd);
    a = dlmread(strtrim(list));
    %size(a)
    bb = a(:,41:end)';
    randIds = randperm(size(bb,2));
    temp = bb(:, randIds(1:numFeasPerImg));

    st_id = ((i-1)*numFeasPerImg) + 1;
    en_id = i*numFeasPerImg;
    size(single(temp))
    feas(i, st_id:en_id) = single(temp);
    size(feas);
end
save('feas1.mat','feas');


% remove any zero columns
badFea_idx = find(sum(feas,1)==0); 
feas(:,badFea_idx)=[];

% learn the vocabulary
vocab.words = vl_kmeans(feas, 20000, 'verbose','algorithm','ann');
vocab.kdtree = vl_kdtreebuild(vocab.words,'NumTrees',10);
save('vocab1.mat','vocab');

