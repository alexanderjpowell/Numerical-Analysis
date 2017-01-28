function DF = JF(F, x)
	%Compute the Jacobian matrix by finite difference schemes.
    n = length(x);
    e = eye(n);
    DF = zeros(n);
    h = 1e-5;
    
    for i = 1:n
        DF(i,:) =  (F(x + h * e(:,i)) - F(x)) / h;
        
    end
    
end