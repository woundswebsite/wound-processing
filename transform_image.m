function timg = transform_image(img,val,sz,scale)

% transform image - img, according to the transformation data - val, form
% .json file, 
% sz - size of an output image
% scale the image bofor transforming if needed, scaling factor - scale

trmatrix = val(1,1).transformation_matrix;
tform = affine2d(trmatrix');
I = imresize(img,scale);
timg = imwarp(I,tform,'Interp', 'linear','OutputView',imref2d(sz));
