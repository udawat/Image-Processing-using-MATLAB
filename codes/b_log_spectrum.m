% 2. Enhance the image of Fourier spectrum (Fig0305(a)(DFT_no_log)) using log transformation with c=1.

clc; clear; close all;

L = 2 ^ 8;

spectrum = imread('../DIP3E_CH03_Original_Images/Fig0305(a)(DFT_no_log).tif');

% log transformation - Fourier Spectrum
c = 1;
r = spectrum;
s_log = c * log(1 + double(r));
s_log_scaled = (L - 1) ./ (max(s_log - min(s_log, [], 'all'), [], 'all')) .* (s_log - min(s_log, [], 'all'));
figure();
subplot(1,2,1);
imshow(spectrum);
xlabel('Original Image');
subplot(1,2,2);
imshow(uint8(s_log_scaled));
xlabel('Log Transformed');