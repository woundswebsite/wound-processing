function depth_cloud = tof2cloud(depth_data)

% convert tof data (array) - depth_data to pointCloud object - depth_cloud

depth_img = depth_data(433:576,:,:);
data_dist=depth_data(1:144,:,:);
data_x=depth_data(145:288,:,:);
data_y=depth_data(289:432,:,:);
dat_color = depth_img/max(depth_img(:));
dat_color = [reshape(dat_color,[],1),reshape(dat_color,[],1),reshape(dat_color,[],1)];
dat_cl = [reshape(data_x,[],1),reshape(data_y,[],1),reshape(data_dist,[],1)];
depth_cloud = pointCloud(dat_cl,'Color',dat_color);