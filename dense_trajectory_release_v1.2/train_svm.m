load FinalFeas.mat;
addpath('/Pulsar3/himangi.s/Soccer/liblinear-1.96/matlab/');

newLabels = mapLabels(labels);
model = train(newLabels', sparse(histFea'));
save('svm_model.mat', 'model');



