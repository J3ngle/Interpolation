function lejaOut = Leja(points)
    [numPoints, n] = size(points);
    lejaOut = zeros(1, numPoints);
    chosenIndex = 1; 
    distances = zeros(1, numPoints);
    for i = 1:numPoints
        distances(i) = norm(points(i, :) - points(chosenIndex, :));
    end
    lejaOut(i) = chosenIndex(i); 
    for j = 2:numPoints
        maxProduct = -1; 
        for k = 1:numPoints
            if ismember(k, lejaOut)
                continue; 
            end
            product = 1;
            for l = 1:j-1
                product = product * distances(k); 
            end
            if product > maxProduct
                maxProduct = product;
                chosenIndex = k; 
            end
        end
        lejaOut(j) = chosenIndex(i); 
        for m = 1:numPoints
            distances(m) = min(distances(m), norm(points(m, :) - points(chosenIndex, :)));
        end
    end
end
