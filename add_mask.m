function Y = add_mask(img,msk)

% Add delineation mask, to the image
% Input: img - image; msk - mask

img = double(img);
cf = [0 1 0];
imd = size(img);
m = max(msk(:));
msk = msk .* max(img(:)) / m;
M = bwmorph(~~msk, 'remove');
msk(~M) = 0;
se = [0 1 0;1 1 1;0 1 0];
if size(img,1)>500
    for i=1:2
        msk = imdilate(msk,se);
    end
end
Y = img;
if size(imd,2)~=3
    Y = repmat(Y,[1 1 3]);
end
for i=1:3
    YY = Y(:, :, i);
    YY(~~msk) = msk(~~msk) .* cf(i);
    Y(:, :, i) = YY;
end
Y = Y - min(Y(:));
Y = Y ./ max(Y(:));