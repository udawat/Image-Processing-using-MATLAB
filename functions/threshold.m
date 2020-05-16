function output_image = threshold(input_image, threshold_value)
    L = 2 ^ 8;
    r = input_image;
    [M, N] = size(r); % size of image
    s_thr = zeros(M, N);
    for x = 1 : M
        for y = 1 : N
            if r(x, y) < threshold_value
                s_thr(x, y) = 0;
            else
                s_thr(x, y) = L - 1;
            end
        end
    end
    output_image = s_thr;
end