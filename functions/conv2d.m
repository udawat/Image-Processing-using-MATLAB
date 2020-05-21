function output_image = conv2d(input_image, kernel)
    %   conv2d
    %   Convolution as per DIP4E Book.
    
    [M, N] = size(input_image);
    [m, n] = size(kernel);
    
    zero_pad_rows = (m - 1) / 2;
    zero_pad_cols = (n - 1) / 2;
    
    input_image_zero_pad_cols = [zeros(M, zero_pad_cols), input_image, zeros(M, zero_pad_cols)];
    input_image_zero_pad = [zeros(zero_pad_rows, size(input_image_zero_pad_cols, 2)); input_image_zero_pad_cols; zeros(zero_pad_rows, size(input_image_zero_pad_cols, 2))];
    
    [new_M, new_N] = size(input_image_zero_pad);
    
    full_conv = zeros(size(input_image_zero_pad));
    
    for x = (floor(m / 2) + 1) : (new_M - zero_pad_rows)
        for y = (floor(n / 2) + 1) : (new_N - zero_pad_cols)
            for s = 1 : m
                for t = 1 : n
                    full_conv(x, y) = full_conv(x, y) + (kernel(m + 1 - s, n + 1 - t) * input_image_zero_pad(x + s - (zero_pad_rows + 1), y + t - (zero_pad_cols + 1)));
                end
            end
        end
    end
    
    crop_conv = zeros(M, N);
    
    for x = 1 : M
        for y = 1 : N
            crop_conv(x, y) = full_conv((x + zero_pad_rows), (y + zero_pad_cols));
        end
    end
    
    output_image = uint8(crop_conv);

end