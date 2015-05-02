load FinalFeasTest.mat;
addpath('/Pulsar3/himangi.s/Soccer/liblinear-1.96/matlab/');
newLabels = mapLabels(labels);
load('svm_model.mat');
predLabels = predict(newLabels', sparse(histFea'), model , '-q 1');
accuracy = sum(predLabels==newLabels')/length(newLabels);
fprintf('\nAccuracy: %f\n',accuracy);

