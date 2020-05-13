% 8. The image (Fig0314(a)(100-dollars)) is a 8-bit gray-scale image of size 500 X 1192 pixels. Plot bit plane images 1 through 8.
% Reconstruct images using (a) bit planes 8 and 7; (b) bit planes 8, 7, and 6, (c) bit planes 8, 7, 6, and 5.

clc; clear; close all;

L = 2 ^ 8;

benjamin = imread('../DIP3E_CH03_Original_Images/Fig0314(a)(100-dollars).tif');

% Bit-Plane Slicing
r = benjamin;
% [M, N] = size(r); % size of image
figure();
subplot(3, 3, 1);
imshow(benjamin);
xlabel('Original Image');
sgtitle('Bit-Plane Slicing');

for k = 1 : log2(L)
    layers{k} = (L - 1) * mod(floor(double(r) / 2 ^ (k - 1)), 2);
    subplot(3, 3, (log2(L) - k + 2));
    imshow(uint8(layers{k}));
    xlabel(['Bit Plane #', num2str(k)]);
end

% (a) Reconstruct images using bit planes 8 and 7.
recon_array = [8 7];
recon_image = zeros(size(r));
for k = 1 : log2(L)
    for i = 1 : length(recon_array)
        if k == recon_array(i)
            recon_image = recon_image + ((2 ^ (k - 1)) * layers{k});
        end
    end
end
figure(2);
subplot(3, 1, 1);
imshow(uint8(recon_image / (L - 1)));
xlabel('Using Bit Planes 8 and 7');

% (b) Reconstruct images using bit planes 8, 7, and 6.
recon_array = [8 7 6];
recon_image = zeros(size(r));
for k = 1 : log2(L)
    for i = 1 : length(recon_array)
        if k == recon_array(i)
            recon_image = recon_image + ((2 ^ (k - 1)) * layers{k});
        end
    end
end
subplot(3, 1, 2);
imshow(uint8(recon_image / (L - 1)));
xlabel('Using Bit Planes 8, 7 and 6');

% (c) Reconstruct images using bit planes 8, 7, 6, and 5.
% figure, imshow(uint8((layers{5} * 16 + layers{6} * 32 + layers{7} * 64 + layers{8} * 128)/255));
recon_array = [8 7 6 5];
recon_image = zeros(size(r));
for k = 1 : log2(L)
    for i = 1 : length(recon_array)
        if k == recon_array(i)
            recon_image = recon_image + ((2 ^ (k - 1)) * layers{k});
        end
    end
end
subplot(3, 1, 3);
imshow(uint8(recon_image / (L - 1)));
sgtitle('Reconstruction');
xlabel('Using Bit Planes 8, 7, 6 and 5');