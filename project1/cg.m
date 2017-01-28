function [ x ] = cg( A, b, x )
% This is an implementation of the Conjugate Gradient Method.  

TOL = 1e-15;
N = 10000;

r = b - A * x;
p = r;
r_old = r' * r;
k = 1;
while k <= N
    prod = A * p;
    denom = p' * prod;
    alpha = r_old / denom;
    x = x + alpha * p;
    r = r - alpha * prod;
    r_new = r' * r;
    if r_new <= TOL
        fprintf('Algorithm complete after %d iterations: \n', k);
        break;
    end
    p = r + r_new / r_old * p;
    r_old = r_new;
    k = k + 1;
end

if k > N
    fprintf('The maximum number of iterations was exceeded. \n');
end


end

