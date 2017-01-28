function [ A ] = T_mat( n )
% This function generates the A_n^2xn^2 matrix asked for in the project.  

mat = zeros(n);
for i = 1:n
    for j = 1:n
        if i == j
            mat(i,j) = 4;
        elseif i == (j + 1) || i == (j - 1)
            mat(i,j) = -1;
        else
            mat(i,j) = 0;
        end
    end
end

A = mat;

end

