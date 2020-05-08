% 3. Perform Gamma correction (Gamma = 2.5) on the intensity ramp (Fig0307(a)(intensity_ramp)).

clc; clear; close all;

L = 2 ^ 8;

int_ramp = imread('../DIP3E_CH03_Original_Images/Fig0307(a)(intensity_ramp).tif');

% gamma - intensity ramp
const = 1;
r = int_ramp;
gamma_ramp = 2.5;
s_gamma_ramp = const * double(r) .^ gamma_ramp;
s_gamma_ramp_scaled = (L - 1) ./ (max(s_gamma_ramp - min(s_gamma_ramp, [], 'all'), [], 'all')) .* (s_gamma_ramp - min(s_gamma_ramp, [], 'all'));
figure();
subplot(1, 2, 1);
imshow(int_ramp);
xlabel('Original Image');
subplot(1, 2, 2);
imshow(uint8(s_gamma_ramp_scaled));
xlabel('Gamma Corrected');