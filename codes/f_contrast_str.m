% 6. Perform contrast stretching with a piece wise transfer function and thresholding on the low contrast image (Fig0310(b)(washed_out_pollen_image)).

clc; clear; close all;

L = 2 ^ 8;

pollen = imread('../DIP3E_CH03_Original_Images/Fig0310(b)(washed_out_pollen_image).tif');

% Contrast Stretching
r = pollen;
r_min = min(r, [], 'all'); % 91
% r_max = max(r, [], 'all'); % 138
s_str = (L - 1) ./ (max((r - r_min), [], 'all')) .* (r - r_min);

figure();
subplot(1, 3, 1);
imshow(pollen);
xlabel('Original Image');
subplot(1, 3, 2);
imshow(s_str);
xlabel('Contrast Stretched');

% Thresholding
[M, N] = size(r);  % size of image
val = uint8(mean(r, 'all'));  % find mean of the 2-D Image Intensity Array
% s_thr = threshold(r, val);  % user-defined function
s_thr = zeros(M, N);
for x = 1 : M
    for y = 1 : N
        if r(x, y) < val
            s_thr(x, y) = 0;
        else
            s_thr(x, y) = L - 1;
        end
    end
end
subplot(1, 3, 3);
imshow(s_thr);
xlabel('Thresholded Image');