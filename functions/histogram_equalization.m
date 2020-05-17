function histogram_equalized_image = histogram_equalization(input_image)
    % histogram_equalization
    % Histogram Equalization
    cdf_image = histogram_get_cdf(input_image);  % Transformation Function
    histogram_equalized_image = zeros(size(input_image));
    for x = 1 : size(input_image, 1)
        for y = 1 : size(input_image, 2)
            histogram_equalized_image(x, y) = cdf_image(input_image(x, y) + 1);
        end
    end
    histogram_equalized_image = uint8(histogram_equalized_image);
end