function x = gs( A, b, x0 )
    % gs: 
    % uses the Gauss-Sidel method to solve a linear system
    %
    % A - the left side of the system
    % b - the right side of the system
    % x0 - an initial guess for the solution
    % tol - tolerance
    % N - the maximum number of iterations
    tol = 1e-15;
    N = 10000;
    
    n = length(b);
    x = zeros(n, 1);
    for k = 1:N
        for i = 1:n
            s = 0;
            cond = true;
            for j = 1:n
                if j == i
                    cond = false;
                elseif cond
                    s = s + A(i, j) * x(j);
                else
                    s = s + A(i, j) * x0(j);
                end
            end
            x(i) = (-s + b(i)) / A(i, i);
        end
        if max(abs(x - x0)) < tol
            fprintf('required %d iterations\n', k);
            return;
        end
        x0 = x;
    end
    
    fprintf('required %d iterations\n', k);
    
end