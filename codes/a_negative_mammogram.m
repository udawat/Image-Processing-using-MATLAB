% 1. Obtain negative of the mammogram image (Fig0304(a)(breast_digital_Xray)).

clc; clear; close all;

L = 2 ^ 8;

mammogram = imread('../DIP3E_CH03_Original_Images/Fig0304(a)(breast_digital_Xray).tif');

% Negative - Digital Mammogram
r = mammogram;
s_neg = L - 1 - r;
figure();
subplot(1, 2, 1);
imshow(mammogram);
xlabel('Original Image');
subplot(1, 2, 2);
imshow(s_neg);
xlabel('Negative Image');
