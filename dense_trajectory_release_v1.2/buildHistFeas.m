load('vocab.mat');
numWords = size(vocab.words,2);

addpath('/Pulsar3/himangi.s/vlfeat-0.9.20/toolbox/'); vl_setup;
videofolder = '/Pulsar3/himangi.s/Soccer/Actions/';

start_vidno = 1; end_vidno = 280

histFea = zeros(numWords, end_vidno-start_vidno+1);

for i = start_vidno : end_vidno
i
    fileName = sprintf('features%d',i)
    cmd = sprintf('find %s -iname %s',videofolder,fileName);
    [st list] = system(cmd);
    tic;a = dlmread(strtrim(list));toc
    fea = a(:,41:end)';
    fea = single(fea);

    %% quantize training features
    [words,distances] = vl_kdtreequery(vocab.kdtree, vocab.words, ...
                                   fea, 'MaxComparisons', 15);

    histFea(:,i) = histc(double(words),1:numWords);
    cc = textscan(strtrim(list),'%s','delimiter','/')
    labels{i} = cc{1}{end-1};
end
save('FinalFeas.mat','histFea','labels');
