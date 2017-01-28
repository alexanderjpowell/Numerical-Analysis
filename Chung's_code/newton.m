function sol =  newton(F, exJF, x, tol)
	xp = 0 * x;
    norm(x-xp)
    residual = [];
    rate = [];
    %DF = exJF(x);
    %DF = JF(F, x);
	while norm(F(x)) > tol & norm(x-xp) > tol
        xp = x;
		%DF = JF(F, x);
        DF = exJF(x);
		x = x - DF\F(x);
		residual = [residual ;norm(x - xp)];
        
	
    end
    %fit(residual,1)
    for i = 1:length(residual)-1
        rate = [rate; residual(i+1)/residual(i)];
    end
    rate
    semilogy(residual, '-o');
    sol = x;
end