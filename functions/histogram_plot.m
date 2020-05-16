function histogram_plot(input_image)
    % histogram_plot
    % Plot Histogram
    L = 2 ^ 8;
    hist_plot = histogram_get(input_image);
    stem((0 : (L-1)), hist_plot, "Marker", "none");
%     title('Histogram');
%     xlabel('Intensity Levels');
    axis([0 (L - 1) min(hist_plot, [], "all") max(hist_plot, [], "all")]);
end