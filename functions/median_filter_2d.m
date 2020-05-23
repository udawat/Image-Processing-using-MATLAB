function output_image = median_filter_2d(input_image, kernel_size)
    %   median_filter_2d
    %   Median Filtering
    
    [M, ~] = size(input_image);
    m=kernel_size(1);
    n=kernel_size(2);
    kernel_median = ones(kernel_size(1), kernel_size(2));
    median_img = zeros(size(input_image));
%     [m, n] = size(kernel_median);
    
    % zero padding
    zero_pad_rows = (m - 1) / 2;
    zero_pad_cols = (n - 1) / 2;
    
    input_image_zero_pad_cols = [zeros(M, zero_pad_cols), input_image, zeros(M, zero_pad_cols)];
    input_image_zero_pad = [zeros(zero_pad_rows, size(input_image_zero_pad_cols, 2)); input_image_zero_pad_cols; zeros(zero_pad_rows, size(input_image_zero_pad_cols, 2))];
    
    [new_M, new_N] = size(input_image_zero_pad);
    
    temp = zeros(size(kernel_median));
    
    for x = (floor(m / 2) + 1) : (new_M - zero_pad_rows)
        for y = (floor(n / 2) + 1) : (new_N - zero_pad_cols)
            for s = 1 : m
                for t = 1 : n
                    temp(s, t) = input_image_zero_pad(x + s - (zero_pad_rows + 1), y + t - (zero_pad_cols + 1));
                end
            end
            median_img(x, y) = median(temp, "all");
        end
    end
    
    output_image = uint8(median_img);
    
end