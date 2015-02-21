

startup;

load('INRIA/inriaperson_final');
model.vis = @() visualizemodel(model, ...
    1:2:length(model.rules{model.start}));
vidname = '/home/himangi/COURSES/HONOURS2/out-8.ogv';


obj = VideoReader(vidname);
nframes = obj.NumberOfFrames;
cls = model.class;

% load and display image
for k = 71 : nframes
    im = read(obj, k);
    
    % detect objects
    tic;
    [ds, bs] = imgdetect(im, model, -0.5);
    toc;
    top = nms(ds, 0.5);
    ds = ds(top, :);
    bs = bs(top, :);
   
    if model.type == model_types.Grammar
        bs = [ds(:,1:4) bs];
    end
    %showboxes(im, reduceboxes(model, bs));
 
    if model.type == model_types.MixStar
        % get bounding boxes
        bbox = bboxpred_get(model.bboxpred, ds, reduceboxes(model, bs));
        bbox = clipboxes(im, bbox);
        top = nms(bbox, 0.5);
        saveTo = sprintf('../bounded/image%04d.png',k);
        showboxes(im, bbox(top,:),saveTo);

    end
    fprintf('\n');
end
