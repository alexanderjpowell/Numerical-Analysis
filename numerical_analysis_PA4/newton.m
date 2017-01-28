% #Input:
% #	f ... function;
%  df ... derivative of f;
% #	x ... initial guess;
% #	tol . Tolerence.
% #Output:
% #	p ... zero of f(x)
% 

%How to use this code:
%  Type the following in the command line...
%       newton( @f, df, pi/4, 1e-4)
%

function p = newton(f, df, x, tol, maxiter)

	maxiter = 100;
	x_p = x;
    fprintf( 'x%d = %.15f\n', 0, x );
	for i=1:maxiter
		%=============================================
	    %Enter your one line code below...
		%See Step 3 in Algorithm 2.3 on Page 68.
		x = x - f(x)/df(x);
		%=============================================
	    if ( abs(f(x)) < tol & abs(x-x_p) < tol )
	        p = x;
	        fprintf( 'x%d = %.15f\n', i, x );
	        disp(['It took ' num2str(i) ' steps to converge.' ])
	        return;
	    else
	        fprintf( 'x%d = %.15f\n', i, x );
	        x_p = x;
	    end
	end
	disp('Reach the maximum number of iterations!');
end
