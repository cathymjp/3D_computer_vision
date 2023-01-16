%kn = kn nearest-neighbors of x
function knn = kNearestNeighbor(dist1, kn, x)
[m, n] = size(dist1);
dist2 = x;
N = 100;

%one dimension
if n == 1
    knn = zeros(N,1);
    vn = zeros(N,1);
    for i = 1:N
        for j = 1:m
            vn(j) = abs(dist2(i) - dist1(j)); %For one dimension, Vn = absolute value of the distance between two points
        end
        vn = sort(vn);
        knn(i) = kn / N / (vn(kn));   %probability density
    end
end

%two-dimension
if n == 2                             
    knn = zeros(N,1);                 
    vn2 = zeros(N,1);
    for i = 1:N
        for j = 1:m
            vn2(j) = sqrt((dist2(i,1) - dist1(j,1))^2 + (dist2(i,2) - dist1(j,2))^2); %Distance between two points in 2D
        end
        vn2 = sort(vn2);
        knn(i) = kn/N/(vn2(kn)); %probability density
    end
end

end