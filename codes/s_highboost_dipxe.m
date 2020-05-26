% 19. Perform the following operations for enhancing the image (Fig0340(a)(dipxe_text))
% a) Blurring with a Gaussian filter
% b) Unsharp masking
% c) Highboost filtering.
% DIP4E - Pg 184 - Fig 3.49

clc;
clear; close all;

% 600 x 259 image
f = imread('../DIP3E_CH03_Original_Images/Fig0340(a)(dipxe_text).tif');

figure;
subplot(3, 2, [1 2]);
imshow(f);
title('Original Image');

% Gaussian Filtering
kernel_size = 5;
sigma = 3;
K = 1;
img_out = conv2d(double(f), gaussian_kernel(kernel_size, sigma, K));  % user-defined function call
subplot(3, 2, 3);
imshow(img_out);
title('Gaussian Filter');
% xlabel([num2str(kernel_size), 'x', num2str(kernel_size), ', with \sigma = ', num2str(sigma)]);

% Mask
mask = f - img_out;
subplot(3, 2, 4);
imshow(mask);
title('Mask');

% Unsharp Masking
k_1 = 1;
unsharp_masking = f + k_1 * mask;
subplot(3, 2, 5);
imshow(unsharp_masking);
title('Unsharp Masking');

% Highboost Filtering
k_2 = 4.5;
highboost_filtering = f + k_2 * mask;
subplot(3, 2, 6);
imshow(uint8(highboost_filtering));
title('Highboost Filtering');