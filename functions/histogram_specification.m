function histogram_matched_image = histogram_specification(input_image, ref_image)
    % histogram_specification
    % Histogram Specification
    L = 2 ^ 8;
    cdf_input_image = histogram_get_cdf(input_image);  % Transformation Function
    cdf_ref_image = histogram_get_cdf(ref_image);  % Transformation Function
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
        histogram_matched_image = uint8(histogram_matched_image);
end