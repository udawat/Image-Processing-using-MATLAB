% 11. Plot the transformation function, enhanced image and histogram after histogram equalization of the image (Fig0323(a)(mars_moon_phobos)).

clc; clear; close all;

L = 2 ^ 8;

phobos = imread('../DIP3E_CH03_Original_Images/Fig0323(a)(mars_moon_phobos).tif');

% Histogram Equalization
figure(1);
subplot(1, 2, 1);
imshow(phobos);
title('Original Image');
subplot(1, 2, 2);
histogram_plot(phobos);
xlabel('Original Histogram');
ylabel('Number of Pixels');

figure(2);
subplot(1, 3, 1);
plot(histogram_get_cdf(phobos));  % Transformation Function
% As noted earlier, the transformation function used in histogram equaliza-
% tion is the cumulative sum of normalized histogram values. We can use fu-
% nction cumsum to obtain the transformation function, as follows:
% hnorm = imhist(f)./numel(f);  % Normalized histogram
% cdf = cumsum(hnorm); % CDF.
xlabel('Transformation Function');
ylabel('Output Intensity');

subplot(1, 3, 2);
imshow(histogram_equalization(phobos));
xlabel('Equalized Image');

subplot(1, 3, 3);
histogram_plot(histogram_equalization(phobos));
xlabel('Equalized Histogram');
ylabel('Number of Pixels');