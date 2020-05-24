% 18. Sharpen the Blurred image of the north pole of the moon (Fig0338(a)(blurry_moon)) using given two Laplacian masks
% DIP4E - Pg 181 - Fig 3.46

clc;
clear; close all;

% 540 x 466 image
f = imread('../DIP3E_CH03_Original_Images/Fig0338(a)(blurry_moon).tif');
[M, N] = size(f);

figure;
subplot(2, 2, 1);
imshow(f);
title('Original Image');
xlabel('Blurry Moon');

% Laplacian
c = -1;
kernel_laplacian{1} = [0 1 0; 1 -4 1; 0 1 0];
kernel_laplacian{2} = [1 1 1; 1 -8 1; 1 1 1];

% Using Laplacian Kernel (a)
laplacian_image{1} = conv2d(double(f), kernel_laplacian{1});  % user-defined function call
subplot(2, 2, 2);
imshow(laplacian_image{1});
title('Laplacian Image');
xlabel('Using Laplacian Kernel (a)');

% Laplacian - Sharpened Image
sharpened_image{1} = f + c * laplacian_image{1};
subplot(2, 2, 3);
imshow(sharpened_image{1});
title('Sharpened Image (a)');
xlabel('c = -1');

% Using Laplacian Kernel (b)
laplacian_image{2} = conv2d(double(f), kernel_laplacian{2});  % user-defined function call

% Laplacian - Sharpened Image
sharpened_image{2} = f + c * laplacian_image{2};
subplot(2, 2, 4);
imshow(sharpened_image{2});
title('Sharpened Image (b)');
xlabel('c = -1');
