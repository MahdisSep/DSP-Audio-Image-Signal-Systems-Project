function [feature_map] = conv2D(img, filters, stride, padding)
    [f, ~, filtersNum] = size(filters);
    [M, N, C] = size(img);
    
    % fix the padding
    if (strcmp(padding, "same"))
        p = (f - 1) / 2;
        tmp = zeros(M + p * 2, N + p * 2, C);
        for channel = 1:C
            tmp(p + 1:M + p, p + 1:N + p, channel) = img(:, :, channel);
        end
        img = tmp;
        [M, N, C] = size(img);
    end
    
    newM = floor((M - f) / stride) + 1;
    newN = floor((N - f) / stride) + 1;
    feature_map = zeros(newM, newN, filtersNum);
    for filter = 1:filtersNum
        for x = 1 : stride : newM
            for y = 1 : stride : newN
                for s = 1 : f
                    for t = 1 : f
                        for channel = 1:C
                            feature_map(x, y, filter) = feature_map(x, y, filter) + double(img(x + s - 1, y + t - 1, channel)) * filters(s, t, filter);
                        end
                    end
                end
            end
        end
    end
end