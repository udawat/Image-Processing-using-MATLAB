% 15. Smooth the image (Fig0333(a)(test_pattern_blurring_orig)) with square averaging filter masks of sizes m=3, 5, 9, 15, and 35 respectively.

clc;
clear; close all;

% 500 x 500 image
f = imread('../DIP3E_CH03_Original_Images/Fig0333(a)(test_pattern_blurring_orig).tif');
figure;
subplot(3, 2, 1);
imshow(f);
xlabel('Original Image');

kernel_size = [3 5 9 15 35];

for k = 1 : length(kernel_size)
    w = ones(kernel_size(k), kernel_size(k));  % define kernel
    w = w / sum(w, "all");
    img_out = conv2d(double(f), w);  % user-defined function call
    subplot(3, 2, (k + 1));
    imshow(img_out);
    sgtitle('Smoothening');
    xlabel(['Filter Size: ', num2str(kernel_size(k)), ' x ', num2str(kernel_size(k))]);
end

% inbuilt_conv_out = conv2(f, w);  % inbuilt function call
% img_out = inbuilt_conv_out / (m*n);
% imshow(uint8(input_image));
% img_out = uint8(output_image / (m*n));