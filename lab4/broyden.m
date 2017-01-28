function sol =  broyden(testF, x, tol)
	%Given the function F, initial guess x, and the tolerence
    %initialize
    xp = 0;
    results = [];
    %Main iteration
    k = 0;
    B = testJF(x);
    iB = inv(B);
    lastx = x;
    x = x - iB * testF(x);
    %while (k < 10)
    count = 1;
    while ((norm(testF(x)) > tol) && (norm(x - xp) > tol) && (k < 500))
        x
        count
        %fprintf('x= %d and k = %d\n',x,count);
        
        y = testF(x) - testF(lastx);
        v = iB * y;
        s = x - xp;
        xp = x;
        iB = iB + ((s - v) * s' * iB)/(s' * v);
        lastx = x;
        x = x - iB * testF(x);
        
        k = k + 1;
        
        results = [results, norm(x - xp)];
        count = count + 1;
    end
    fprintf('Algorithm executed successfully. \n');
    fprintf('Algorithm took %d iterations to complete. \n', k);
    sol = x;
	%Stopping criteria
    if k >= 500
        fprintf('Algorithm executed unsuccessfully. \n');
        fprintf('Algorithm exceeded maximum number of iterations. \n');
    end
	%Plotting purpose
    
    %semilogy(results, '-o')
    
end


