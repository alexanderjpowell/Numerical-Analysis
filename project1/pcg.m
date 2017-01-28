function [ ] = pcg( n, A, b, x )
% This function implements the preconditioned conjugate gradient method
% Note: the function itself doesn't have any explicit outputs, only 
% print stmts.
%n = n * n;
TOL = 1e-15;
N = 10000;

% step 1
r = b - A * x;

% This is where to change the conditioner:
%cond_inv = 4 * eye(n);          % M1
%cond_inv = diag(T_mat(n));    % M2

ident = T_mat(n/2);
zer = zeros(n/2);
cond_inv = [ident, zer; zer, ident];
cond_inv = inv(cond_inv);

w = cond_inv * r;
v = cond_inv' * w;
alpha = 0;
for j = 1:n
    alpha = alpha + (w(j))^2;
end

% step 2
k = 1;
% step 3
while k <= N
    % step 4
    if norm(v) < TOL
        fprintf('The solution vector is: %d\n', x);
        fprintf('\n');
        fprintf('And the residual is : %d\n', r);
        fprintf('\n');
        fprintf('Number of iterations is: %d\n', k);
        fprintf('The procedure was successful. \n');
        break;
    end
    
    % step 5
    u = A * v;
    bottom = 0;
    for j = 1:n
        bottom = bottom + v(j) * u(j);
    end
    t = alpha / bottom;
    x = x + t * v;
    r = r - t * u;
    w = cond_inv * r;
    beta = 0;
    for j = 1:n
        beta = beta + (w(j))^2;
    end
    
    % step 6
    if abs(beta) < TOL
        if norm(r) < TOL
            fprintf('The solution vector is: %d\n', x);
            fprintf('\n');
            fprintf('And the residual is : %d\n', r);
            fprintf('\n');
            fprintf('Number of iterations is: %d\n', k);
            fprintf('The procedure was successful. \n');
            break;
        end
    end
    
    % step 7
    s = beta / alpha;
    v = cond_inv' * w + s * v;
    alpha = beta;
    k = k + 1;
end

% step 8
if k > N
    fprintf('Number of iterations is: %d\n', k);
    fprintf('The maximum number of iterations was exceeded. \n');
    fprintf('The procedure was unsuccessful. \n');
end


end

