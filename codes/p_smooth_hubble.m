% 16. Filter the image of size 528 X 485 pixels from the Hubble Space Telescope (Fig0334(a)(hubble-original)) using following:
% a) 15 X 15 averaging mask
% b) Thresholding

clc;
clear; close all;

% 528 X 485 image
f = imread('../DIP3E_CH03_Original_Images/Fig0334(a)(hubble-original).tif');

figure;
subplot(1, 3, 1);
imshow(f);
title('Original Image');
xlabel('Hubble Telescope');

% Averaging Mask
kernel_size = 15;
w = ones(kernel_size, kernel_size);  % define kernel
w = w / sum(w, "all");
img_out = conv2d(double(f), w);  % user-defined function call
subplot(1, 3, 2);
imshow(img_out);
title('Averaging Mask');
xlabel(['Size: ', num2str(kernel_size), ' x ', num2str(kernel_size)]);

% Thresholding
val = (0.25 * max(img_out, [], 'all'));  % find 25% of maximum intensity value of filtered 2-D Image
img_threshold = threshold(img_out, val);
subplot(1, 3, 3);
imshow(img_threshold);
title('Thresholded Image');
xlabel('25% of Max. Pixel Value');