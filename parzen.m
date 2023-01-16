function parzenEstimate = parzen(w,x,h) %w = est. point, x = training points
[n,~,dimension] = size(w); % n = training points, d = dimensionality
parzenEstimate = zeros(1,dimension);

for i = 1:dimension
    hn = h; %parameter
    for j = 1:n
        hn = hn / sqrt(j); %hn = h1 / sqrt(n)
        %behavior of the Parzen-window method
        %Zero-mean; average of normal densities centered at the samples xi
        parzenEstimate(i) = parzenEstimate(i) + exp(-(x - w(j,:,i))*(x - w(j,:,i))'/ (2 * power(hn,2))) / (hn * sqrt(2*3.14));
    end
    parzenEstimate(i) = parzenEstimate(i) / n;
end