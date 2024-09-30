function [coefficients, inte_vals,interpolated_values,Pcomp,Qcomp] = mono(x, y, x_inter)
    if numel(x) ~= numel(y)
        error('Input dimensions do not match.');
    end
    n = length(x);
    Van = zeros(n, n);
    for i = 1:n
        Van(:, i) = x.^(n-i);
    end
    [Lcomp, Ucomp, Pcomp, Qcomp] = completePivoting2(Van);
    %Forward substitution for our given matrix
coefficients=forwardSubstitution(Lcomp,y);
%Backward substitution for our given matrix
inte_vals=backwardSubstitution(Ucomp,x);
    % Evaluate the interpolating polynomial at x_interpolate
    interpolated_values = polyval(flip(coefficients'), x_inter);
end
