function sol =  chord(F, x, tol)
	%Given the function F, initial guess x, and the tolerence
    %initialize
    xp = 0;
    results = [];
    %Main iteration
    DF = exJF(x);
    while ((norm(F(x)) > tol) && (norm(x - xp) > tol))
        xp = x;
        %exact jacobian
        %JF = exJF(x);
        %approx jacob
        %DF = JF(F,x);
        
        x = x - DF \ F(x);
        results = [results; norm(x - xp)];
    end
    
	%Stopping criteria
    
	%Plotting purpose
    semilogy(results, '-o')
    
end


