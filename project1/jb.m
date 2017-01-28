function [  ] = jb( n, A, b )
% This functions performs the jacobian iterative method to solve a system
% of linear equations.  

% TAKE THIS OUT AFTER!!! %
n = n * n;

XO = zeros(n,1);
TOL = 1e-15;
N = 1000;

%step 1
k = 1;
%null_x = [];
%step 2
null_x = zeros(n,1);
while k <= N
    %step 3
    for i = 1:n
        empty = 0;
        for j = 1:n
            if (j ~= i)
                empty = empty + (A(i,j) * XO(j));
            end
        end
        null_x(i) = (1/A(i,i)) * (-1 * empty + b(i));
    end
    %fprintf('Output is: %d\n', null_x);
    %step 4
    %null_x = null_x';
    
    norm = null_x - XO;
    norm = abs(norm);
    final_norm = max(norm);
    if final_norm < TOL
        fprintf('The procedure was successful. \n');
        fprintf('The solution vector is: \n');
        fprintf('\n');
        fprintf('%d\n', null_x);
        fprintf('\n');
        fprintf('After K iterations: %d\n', k);
        break;
    end
    
    k = k + 1;
    
    for i = 1:n
        XO(i) = null_x(i);
    end
    
end

%out = null_x;
%out;
if k > N
    fprintf('The procedure was unsuccessful. \n');
    fprintf('Maximum number of iterations exceeded. \n');
end

end

