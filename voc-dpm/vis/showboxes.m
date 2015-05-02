function showboxes(im, boxes, out)
% Draw bounding boxes on top of an image.
%   showboxes(im, boxes, out)
%
%   If out is given, a pdf of the image is generated (requires export_fig).

% AUTORIGHTS
% -------------------------------------------------------
% Copyright (C) 2011-2012 Ross Girshick
% Copyright (C) 2008, 2009, 2010 Pedro Felzenszwalb, Ross Girshick
% Copyright (C) 2007 Pedro Felzenszwalb, Deva Ramanan
%
% This file is part of the voc-releaseX code
% (http://people.cs.uchicago.edu/~rbg/latent/)
% and is available under the terms of an MIT-like license
% provided in COPYING. Please retain this notice and
% COPYING if you use this file (or a portion of it) in
% your project.
% -------------------------------------------------------

if ~isempty(boxes)
    numfilters = floor(size(boxes, 2)/4);
    for i = 1:numfilters
        x1 = boxes(:,1+(i-1)*4);
        y1 = boxes(:,2+(i-1)*4);
        x2 = boxes(:,3+(i-1)*4);
        y2 = boxes(:,4+(i-1)*4);
        % remove unused filters
        del = find(((x1 == 0) .* (x2 == 0) .* (y1 == 0) .* (y2 == 0)) == 1);
        x1(del) = [];
        x2(del) = [];
        y1(del) = [];
        y2(del) = [];
        
        shapeInserter = vision.ShapeInserter('Shape', 'Rectangles', 'BorderColor', 'White' );
        im = step(shapeInserter, im, int32([x1 y1 x2-x1 y2-y1]));
        
    end
end
imwrite(im,out);
