% 5. Perform Gamma correction on Aerial image (Fig0309(a)(washed_out_aerial_image)) with c=1 and Gamma = 3, 4, 5 respectively.

clc; clear; close all;

L = 2 ^ 8;

satellite = imread('../DIP3E_CH03_Original_Images/Fig0309(a)(washed_out_aerial_image).tif');

% gamma - satellite
c = 1;
r = satellite;
figure();
subplot(2, 2, 1);
imshow(satellite);
xlabel('Original Image');

gamma = [3 4 5];
for k = 1 : length(gamma)
    s_gamma = c * double(r) .^ gamma(k);
    s_gamma_scaled = (L - 1) ./ (max(s_gamma - min(s_gamma, [], 'all'), [], 'all')) .* (s_gamma - min(s_gamma, [], 'all'));
    subplot(2, 2, (k + 1));
    imshow(uint8(s_gamma_scaled));
    xlabel(['\gamma = ', num2str(gamma(k))]);
end