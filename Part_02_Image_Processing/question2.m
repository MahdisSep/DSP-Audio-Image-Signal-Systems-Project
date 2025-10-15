close all;
clc;
%--------------------------LAYER ONE KERNELS-------------------------------
bottom_sobel =    [[-1,-2,-1]; [0, 0, 0]; [1, 2, 1]];              
top_sobel    =    [[1, 2, 1]; [0, 0, 0]; [-1,-2,-1]];
sharpening   =    [[0,-1,0]; [-1,5,-1];[0,-1,0]];
weighted_averaging_3x3 = (1/16)*[[1, 2, 1]; [2, 4, 2]; [1, 2, 1]];

l1_filters = cat(3, bottom_sobel, top_sobel, sharpening, weighted_averaging_3x3);

%--------------------------LAYER TWO KERNELS-------------------------------
robert_x = [[1, 0]; [0, -1]]; 
robert_y = [[0, +1]; [-1, 0]];
averaging_2x2 = (1/4)*[[1, 1]; [1, 1]];

l2_filters = cat(3, robert_x, robert_y, averaging_2x2);

%--------------------------LAYER THREE KERNELS-----------------------------
gaussian_5x5 = (1/273)*[[1,4,7,4,1]; [4,16,26,16,4]; [7,26,41,26,7]; [4,16,26,16,4]; [1,4,7,4,1]];
averaging_5x5 = (1/25)*ones(5, 5);

l3_filters = cat(3, gaussian_5x5, averaging_5x5);

%--------------------------------------------------------------------------
img = imread('E:\term4\Signal\project\project-files\images\goodfellow.png');

[~, ~, l1_filtersNum] = size(l1_filters);
[~, ~, l2_filtersNum] = size(l2_filters);
[~, ~, l3_filtersNum] = size(l3_filters);

%################################## 1 #####################################
figure,
subplot(1, 5, 1)
imshow(img)
title("Original Image")

layer_one_output = conv2D(img, l1_filters, 1, 'same');

for i = 1:l1_filtersNum
    subplot(1, 5, i + 1)
    imshow(uint8(255 * mat2gray(layer_one_output(:,:,i))))
    title(sprintf('Filter%d', i))
end
%################################## 2 #####################################
figure,
subplot(1, 4, 1)
imshow(img)
title("Original Image")

layer_two_output = conv2D(layer_one_output, l2_filters, 2, 'valid');

for i = 1:l2_filtersNum
    subplot(1, 4 , 1+i)
    imshow(uint8(255 * mat2gray(layer_two_output(:,:,i))))
    title(sprintf('Filter%d', i))
    
end
%################################## 3 #####################################
figure
subplot(1,3,1)
imshow(img)
title("Original Image")

layer_three_output = conv2D(img, l3_filters, 1, 'same');

for i = 1:l3_filtersNum
    subplot(1, 3 , i+1)
    imshow(uint8(255 * mat2gray(layer_three_output(:,:,i))))
    title(sprintf('Filter%d', i))
end