function kernel = gaussian_kernel(kernel_size, sigma, K)
    m = kernel_size;
    n = kernel_size;
    w = ones(m, n);
    for s = 1 : m
        for t = 1 : n
            r = sqrt((s - (floor(m / 2) + 1)) ^ 2 + (t - (floor(n / 2) + 1)) ^ 2);
            w(s, t) = K * exp(-(r ^ 2) / (2 * sigma ^ 2));
        end
    end
    sum_elements = sum(w, "all");
    kernel = w / sum_elements;
end