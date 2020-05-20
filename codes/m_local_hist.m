% 13. Perform global and local (neighborhood size of 3 X 3) histogram equalization on the image (Fig0326(a)(embedded_square_noisy_512)).
clc; clear; close all;

L = 2 ^ 8;

input_image = imread('../DIP3E_CH03_Original_Images/Fig0326(a)(embedded_square_noisy_512).tif');

figure();
subplot(2,2,1);
imshow(input_image);
xlabel('Original Image');
subplot(2,2,2);
imshow(histogram_equalization(input_image));
% imshow(histeq(input_image));
xlabel('Globally Equalized Image');
sgtitle('Local Histogram Processing');

% Using inbuilt function
% subplot(2,2,3);

% Window Size
m = 3;
n = 3;

% Processing the local neighborhood
pad_input_image = padarray(input_image, [((m - 1) / 2) ((n - 1) / 2)], "symmetric");
local_image = zeros(m, n);
output_image = zeros(size(pad_input_image));
local_eq_image = zeros(m, n);

for x = (floor(m / 2) + 1) : (size(pad_input_image, 1) - ((m - 1) / 2))
    for y = (floor(n / 2) + 1) : (size(pad_input_image, 2) - ((n - 1) / 2))
        for s = 1 : m
            for t = 1 : n
                local_image(s, t) = pad_input_image(x + s - (((m - 1) / 2) + 1), y + t - (((n - 1) / 2) + 1));
            end
        end
        local_eq_image = histogram_equalization(local_image);
%         local_eq_image = (L-1)*(histeq(local_image));
        output_image(x, y) = local_eq_image(((m + 1) / 2), ((n + 1) / 2));
    end
end

crop_output_image = zeros(size(input_image));
for x = 1 : size(input_image, 1)
    for y = 1 : size(input_image, 2)
        crop_output_image(x, y) = output_image((x + (m - 1) / 2), (y + (m - 1) / 2));
    end
end

subplot(2,2,3);
imshow(uint8(crop_output_image));
xlabel('Locally Equalized Image');

% Using Local Histogram Statistics
% Parameters
C = 22.8;
k0 = 0;
% k1 = 0.25;
k1 = 0.1;
k2 = 0;
k3 = 0.1;

pdf_global_image = histogram_get(input_image) / numel(input_image);

% Calculate First Moment ,i.e., Mean
global_mean = 0;
for k = 0 : (L - 1)
    global_mean = global_mean + (k * pdf_global_image(k + 1));
end

% Calculate Second Moment ,i.e., Variance
global_variance = 0;

for k = 0 : (L - 1)
    global_variance = global_variance + (((k - global_mean) .^ 2) .* pdf_global_image(k + 1));
end
global_std_dev = (global_variance) ^ 0.5;

% global_mean = mean(sq, "all");
% global_std_dev = std2(sq);
% imshow(adapthisteq(input_image, 'NumTiles', [3 3], 'ClipLimit', 0.2))

% Process the neighborhood
pad_input_image = padarray(input_image, [((m - 1) / 2) ((n - 1) / 2)], "symmetric");
local_image = zeros(m, n);
output_image = zeros(size(pad_input_image));

for x = (floor(m / 2) + 1) : (size(pad_input_image, 1) - ((m - 1) / 2))
    for y = (floor(n / 2) + 1) : (size(pad_input_image, 2) - ((n - 1) / 2))
        for s = 1 : m
            for t = 1 : n
                local_image(s, t) = pad_input_image(x + s - (((m - 1) / 2) + 1), y + t - (((n - 1) / 2) + 1));
            end
        end
        local_mean = 0;
        local_variance = 0;
        pdf_local_image = histogram_get(local_image) / numel(local_image);
        for k = 0 : (L - 1)
            local_mean = local_mean + k * pdf_local_image(k + 1);
            local_variance = local_variance + ((k - local_mean) ^ 2) * pdf_local_image(k + 1);
        end
        local_std_dev = (local_variance) ^ 0.5;
        if ((k0 * global_mean) <= local_mean) && (local_mean <= (k1 * global_mean))
            if ((k2 * global_std_dev) <= local_std_dev) && (local_std_dev <= (k3 * global_std_dev))
                output_image(x, y) = C * pad_input_image(x, y);
            end
        else
            output_image(x, y) = 1 * pad_input_image(x, y);
        end
    end
end

crop_output_image = zeros(size(input_image));
for x = 1 : size(input_image, 1)
    for y = 1 : size(input_image, 2)
        crop_output_image(x, y) = output_image((x + (m - 1) / 2), (y + (m - 1) / 2));
    end
end

subplot(2,2,4);
imshow(uint8(crop_output_image));
xlabel('Equalized using Histogram Statistics');
