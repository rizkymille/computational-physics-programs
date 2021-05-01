% Problem 14.1
data = [0.90 1.32 1.96 1.85 2.29 1.42 1.35 1.47 1.74 1.82 1.30 1.47 1.92 1.65 2.06 1.55 1.95 1.35 1.78 2.14 1.63 1.66 1.05 1.71 1.27]; % input data untuk diolah
data_mean = mean(data); % fungsi hitung mean
data_median = median(data); % fungsi hitung median
data_mode = mode(data); % fungsi hitung mode
data_range = range(data); % fungsi hitung range
data_stdev = std(data); % fungsi hitung standard deviation
data_var = var(data); % fungsi hitung variansi
data_coeff_var = std(data)/mean(data); % menghitung koefisien variansi yang merupakan rasio antara variansi dengan mean
fprintf("Mean: %f\nMedian: %f\nMode: %f\nRange: %f\nStandard Deviation: %f\nVariance: %f\nCoefficient of Variation: %f\n", data_mean, data_median, data_mode, data_range, data_stdev, data_var, data_coeff_var)

% Output:
% Mean: 1.624400
% Median: 1.650000
% Mode: 1.350000
% Range: 1.390000
% Standard Deviation: 0.339388
% Variance: 0.115184
% Coefficient of Variation: 0.208931