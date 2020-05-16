function hist_get = histogram_get(input_image)
    % histogram_get
    % Get Histogram
    L = 2 ^ 8;
    [M, N] = size(input_image); % size of given image
    hist_get = zeros(1, L);
    for x = 1 : M
        for y = 1 : N
            for k = 0 : (L - 1)  % intensities - 0 to 255
                if input_image(x, y) == k
                    hist_get(k + 1) = hist_get(k + 1) + 1;
                end
            end
        end
    end
end