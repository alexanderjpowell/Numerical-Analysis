function [ ] = jacobi2( a,b,x0 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
tol = 1e-15;
n = length(b);
x = zeros(n,1);
for j = 1 : n
     x(j) = ((b(j) - a(j,[1:j-1,j+1:n]) * x0([1:j-1,j+1:n])) / a(j,j)); % the first iteration
end
%x1 = x';
x1 = x;
k = 1;
x_ny = zeros(n,1);
%fprintf('x1:\n');
%fprintf('%d\n', x1);
%fprintf('x0:\n');
%fprintf('%d\n', x0);
%fprintf('%d\n', length(x1));
%fprintf('%d\n', length(x0));
while norm(x1-x0,1) > tol
    for j = 1 : n
        x_ny(j) = ((b(j) - a(j,[1:j-1,j+1:n]) * x1([1:j-1,j+1:n])) / a(j,j));
    end
    x0 = x1;
    x1 = x_ny;
    k = k + 1;
end

fprintf('%d\n', x1);
fprintf('Method completed after %d iterations. \n', k);

end

