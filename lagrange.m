function y_int = lagrange(x_interp, x, y)
    n = length(x);
    % Calculate the barycentric weights
    w = baryboy(x);
    y_int = zeros(size(x_interp));

    for k = 1:length(x_interp)
        num = 0;
        denom = 0;
        for j = 1:n
            if x_interp(k) == x(j)
                y_int(k) = y(j);
                break;
            end
            w_j = w(j) / (x_interp(k) - x(j));
            num = num + w_j * y(j);
            denom = denom + w_j;
        end
        y_int(k) = num / denom;
    end
end

function w = baryboy(x)
    n = length(x);
    w = ones(1, n);
    
    for j = 1:n
        for k = 1:n
            if k ~= j
                w(j) = w(j) / (x(j) - x(k));
            end
        end
    end
end
