function [ x ] = gauss( a, b )
% This function performs a standard Gaussian Elimination on any matrix A
% and it's column vector b.  

ab = [a, b];
[R, C] = size(ab);
k = 0;
for j = 1:(R - 1)
    for i = (j + 1):R
        ab(i,j:C) = ab(i,j:C) - ab(i,j) / ab(j,j) * ab(j,j:C);
        k = k + 1;
    end
end

x = zeros(R,1);
x(R) = ab(R,C) / ab(R,R);
for i = (R - 1):-1:1
    x(i) = (ab(i,C) - ab(i,(i + 1):R) * x((i + 1):R)) / ab(i,i);
    k = k + 1;
end

fprintf('The number of iterations is: %d\n', k);

end

