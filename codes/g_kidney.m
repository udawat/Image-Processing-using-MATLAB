% 7. Enhance the Aortic Angiogram image (Fig0312(a)(kidney)) using following two transfer functions.

clc; clear; close all;

L = 2 ^ 8;

kidney = imread('../DIP3E_CH03_Original_Images/Fig0312(a)(kidney).tif');

% Intensity-Level Slicing - Reducer
r = kidney;
[M, N] = size(r); % size of image
r_A = 150; % min = 0, define the region of interest - like, intensity of contrast medium
r_B = 230; % max = 230
val = (L - 1); % approx value from DIP4E - Pg 130 - Fig 3.11(a)
s_slice_red = zeros(M, N);
for x = 1 : M
    for y = 1 : N
        if r(x, y) < r_A
            s_slice_red(x, y) = 0;
        end
        if r(x, y) > r_B
            s_slice_red(x, y) = 0;
        end
        if r(x, y) > r_A
            if r(x, y) < r_B
                s_slice_red(x, y) = val;
            end
        end
    end
end
figure();
title('Intensity-Level Slicing');
subplot(1, 3, 1);
imshow(kidney);
xlabel('Original Image');
subplot(1, 3, 2);
imshow(uint8(s_slice_red));
xlabel('Reduced to Binary');

% Intensity-Level Slicing - Preserve
r_mean = uint8(mean(r, 'all'));
delta = 45;
r_A = r_mean - delta; % min = 0, define the region of interest - like, intensity of contrast medium
r_B = r_mean + delta; % max = 230
val = (2 / 5) * 255;  % approx value from DIP4E - Pg 130 - Fig 3.11(a)

s_slice_pres = zeros(M, N);
for x = 1 : M
    for y = 1 : N
        if r(x, y) < r_A
            s_slice_pres(x, y) = r(x, y);
        end
        if r(x, y) > r_B
            s_slice_pres(x, y) = r(x, y);
        end
        if r(x, y) > r_A
            if r(x, y) < r_B
                s_slice_pres(x, y) = val;
            end
        end
    end
end
subplot(1,3,3);
imshow(uint8(s_slice_pres));
xlabel('Preserve');