function cdf_image = histogram_get_cdf(input_image)
    % histogram_get_cdf
    % Histogram Transformation Function
    L = 2 ^ 8;
    pdf_image = histogram_get(input_image) / numel(input_image);
    cdf_image = zeros(1, L);
    for k = 1 : L
        if k == 1
            cdf_image(k) = pdf_image(k);
        else
            cdf_image(k) = cdf_image(k - 1) + pdf_image(k);
        end
    end
    cdf_image = round((L - 1) * cdf_image);  % Transformation Function
end