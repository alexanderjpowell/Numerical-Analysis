function sol =  sham(F, x, tol)
	%Given the function F, initial guess x, and the tolerence
    %initialize
    xp = 0;
    results = [];
    %Main iteration
    k = 0;
    m = 2;
    yp = 0;
    y = 0;
    %while ((norm(testF(x)) > tol) && (norm(x - xp) > tol) && k < 500)
    %while ((norm(F(x)) > tol) && norm(y - yp) > tol && k < 500)
    while ((norm(F(x)) > tol) && k < 500)
        yp = y;
        y = x;
        
        %exact jacobian
        jac = exJF(x);
        %approx jacob
        %DF = JF(testF,x);
        % begin SHAM
        
        if (k == 0)
            y = x;
        else
            y = y - jac \ F(y);
        end
        
        x = y;
        % end   SHAM
        
        results = [results; norm(x - xp)];
        % increment k
        k = k + 1;
        %fprintf('%d\n', norm(testF(x)));
        %fprintf('%d\n', norm(x - xp));
    end
    fprintf('Algorithm executed successfully in %d iterations.  \n', k);
    sol = x;
	%Stopping criteria
    if (k >= 500)
        fprintf('Algorithm reached maximum number of iterations.  \n');
        fprintf('Algorithm executed unsuccessfully.  \n');
    end
	%Plotting purpose
    semilogy(results, '-o')
    
end


