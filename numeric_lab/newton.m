function sol =  newton(F, x, tol)
	%Given the function F, initial guess x, and the tolerence
    %initialize
    xp = 0;
    results = [];
    %Main iteration
    k = 0;

    while ((norm(F(x)) > tol) && (norm(x - xp) > tol) && k < 500)
        xp = x;
        
        %exact jacobian
        %jac = exJF(x);
        %approx jacob
        DF = JF(F,x);
        
        x = x - DF \ F(x);
        results = [results; norm(x - xp)];
        k = k + 1;
    end
    sol = x
	%Stopping criteria
    
	%Plotting purpose
    semilogy(results, '-o')
    
end


