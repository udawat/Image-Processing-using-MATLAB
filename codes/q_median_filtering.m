% 17. Reduce the noise level in the X-ray image of a circuit board (Fig0335(a)(ckt_board_saltpep_prob_pt05)) corrupted by salt-and-pepper noise.
% a) 3 X 3 averaging mask
% b) 3 X 3 median filter
% DIP4E - Pg 176 - Fig 3.43

clc;
clear; close all;

% 440 x 455 image
f = imread('../DIP3E_CH03_Original_Images/Fig0335(a)(ckt_board_saltpep_prob_pt05).tif');

figure;
subplot(1, 3, 1);
imshow(f);
title('Original Image');
xlabel('Salt & Pepper Noise');

% Averaging Filter
kernel_size = 3;
w = ones(kernel_size, kernel_size);  % define kernel
w = w / sum(w, "all");
img_out = conv2d(double(f), w);  % user-defined function call
subplot(1, 3, 2);
imshow(img_out);
title('Averaging Filter');
xlabel(['Filter Size: ', num2str(kernel_size), ' x ', num2str(kernel_size)]);

% Median Filtering
% imshow(medfilt2(f, [7 7], 'symmetric'));  % inbuilt function
img_out = median_filter_2d(f, [3 3]);  % user-defined function call
subplot(1, 3, 3);
imshow(img_out);
title('Median Filter');
xlabel('Filter Size: 3x3');