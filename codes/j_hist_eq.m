% 10. Generate and plot the histogram equalized images for the following images:
% Fig0320(1)(top_left), Fig0320(2)(2nd_from_top), Fig0320(3)(third_from_top), Fig0320(4)(bottom_left).

clc; clear; close all;

L = 2 ^ 8;

pollen_hist_eq{1} = imread('../DIP3E_CH03_Original_Images/Fig0320(1)(top_left).tif');
pollen_hist_eq{2} = imread('../DIP3E_CH03_Original_Images/Fig0320(2)(2nd_from_top).tif');
pollen_hist_eq{3} = imread('../DIP3E_CH03_Original_Images/Fig0320(3)(third_from_top).tif');
pollen_hist_eq{4} = imread('../DIP3E_CH03_Original_Images/Fig0320(4)(bottom_left).tif');

% Histogram Equalization
figure();
i = 1;
for k = 1 : length(pollen_hist_eq)
    subplot(4, 3, i);
    imshow(pollen_hist_eq{k});
    xlabel('Original Image');
    i = i + 1;
    subplot(4, 3, i);
    imshow(histogram_equalization(pollen_hist_eq{k}));
    xlabel('Equalized Image');
    i = i + 1;
    subplot(4, 3, i);
    histogram_plot(histogram_equalization(pollen_hist_eq{k}));
    xlabel('Equalized Histogram');
    i = i + 1;
end