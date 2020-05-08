% 4. Perform Gamma correction on the MRI image (Fig0308(a)(fractured_spine)) of a fractured human spine with c=1, Gamma = 0.6, 0.4, 0.3 respectively.

clc; clear; close all;

L = 2 ^ 8;

spine = imread('../DIP3E_CH03_Original_Images/Fig0308(a)(fractured_spine).tif');

% gamma - fractured spine
c = 1;
r = spine;
figure();
subplot(2,2,1);
imshow(spine);
xlabel('Original Image');

gamma = [0.6 0.4 0.3];
for k = 1 : length(gamma)
    s_gamma = c * double(r) .^ gamma(k);
    s_gamma_scaled = (L - 1) ./ (max(s_gamma - min(s_gamma, [], 'all'), [], 'all')) .* (s_gamma - min(s_gamma, [], 'all'));
    subplot(2, 2, (k + 1));
    imshow(uint8(s_gamma_scaled));
    xlabel(['\gamma = ', num2str(gamma(k))]);
end