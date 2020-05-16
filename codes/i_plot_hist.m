% 9. Plot the histograms of the images Fig0316(1)(top_left), Fig0316(2)(2nd_from_top), Fig0316(3)(third_from_top), Fig0316(4)(bottom_left).

clc; clear; close all;

L = 2 ^ 8;

pollen{1} = imread('../DIP3E_CH03_Original_Images/Fig0316(1)(top_left).tif');
pollen{2} = imread('../DIP3E_CH03_Original_Images/Fig0316(2)(2nd_from_top).tif');
pollen{3} = imread('../DIP3E_CH03_Original_Images/Fig0316(3)(third_from_top).tif');
pollen{4} = imread('../DIP3E_CH03_Original_Images/Fig0316(4)(bottom_left).tif');

% Plot Histograms
figure();
for k = 1 : length(pollen)
    subplot(2, length(pollen), k);
    imshow(pollen{k});
    subplot(2, length(pollen), (k + length(pollen)));
    histogram_plot(pollen{k});  % user-built function call
    sgtitle('Histograms of Images');
%     imhist(pollen{k});
end