% 12. Enhance the image (Fig0323(a)(mars_moon_phobos)) using histogram
% matching. The shape of the specified histogram is as given

clc; clear; close all;

L = 2 ^ 8;

input_image = imread('../DIP3E_CH03_Original_Images/Fig0323(a)(mars_moon_phobos).tif');

% Histogram Matching
figure();
subplot(2, 3, 1);
imshow(input_image);
xlabel('Original Image');
subplot(2, 3, 4);
histogram_plot(input_image);
xlabel('Original Histogram');
axis([0 (L - 1) 0 2e4]);
sgtitle('Histogram Specification');

% Generate Specified Histogram using Two Mode Gauss function from "DIP using MATLAB" Book.
pdf_ref_image = twomodegauss(0.15, 0.05, 0.75, 0.05, 1, 0.07, 0.002);
subplot(2, 3, 5);
stem(0 : (L - 1), pdf_ref_image, "Marker", "none");
xlabel('Specified Histogram');

cdf_ref_image = zeros(1, L);
for k = 1 : L
    if k == 1
        cdf_ref_image(k) = pdf_ref_image(k);
    else
        cdf_ref_image(k) = cdf_ref_image(k - 1) + pdf_ref_image(k);
    end
end
cdf_ref_image = round((L - 1) * cdf_ref_image);  % Transformation Function

% Get input image CDF
cdf_input_image = histogram_get_cdf(input_image);

% Assign Specified Histogram to Given Input Image
transformation_matrix = (L - 1) * ones(1, L);
for p = 1 : L
    for q = 1 : L
        if cdf_input_image(p) < cdf_ref_image(q)
            transformation_matrix(p) = q;
            break;
        end
    end
end

histogram_matched_image = zeros(size(input_image));
for x = 1 : size(input_image, 1)
    for y = 1 : size(input_image, 2)
        t = input_image(x, y) + 1;
        histogram_matched_image(x, y) = transformation_matrix(t);
    end
end

subplot(2, 3, 3);
% specd = histogram_specification(phobos, ref_image);
imshow(uint8(histogram_matched_image));
xlabel('Matched Image');
subplot(2, 3, 6);
histogram_plot(histogram_matched_image);
xlabel('Equalized Histogram');
axis([0 (L - 1) 0 2e4]);