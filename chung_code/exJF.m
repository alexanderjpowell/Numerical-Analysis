function JF = exJF( w, x, a, b, h )
	N = length(w);
	JF = sparse( N, N);
	for j = 2:N
		i = j-1;
        if i == 1
            JF(i,j) = -1 + 0.5 * h * fyp( x(i), w(i), 0.5*(w(i+1) - a)/h );
        else
            JF(i,j) = -1 + 0.5 * h * fyp( x(i), w(i), 0.5*(w(i+1) - w(i-1))/h );
        end
	end
	
	for j = 1:N
		i = j;
        if i==1
            JF(i,j) = 2 + h^2 * fy( x(i), w(i), 0.5*(w(i+1) - a)/h );
        elseif i==N
            JF(i,j) = 2 + h^2 * fy( x(i), w(i), 0.5*(b-w(i-1))/h );
        else
            JF(i,j) = 2 + h^2 * fy( x(i), w(i), 0.5*(w(i+1) - w(i-1))/h );
        end
	end
	
	for j = 1:N-1
		i = j+1;
        if i == N
            JF(i,j) = -1 - 0.5 * h * fyp( x(i), w(i), 0.5*(b - w(i-1))/h );
        else
            JF(i,j) = -1 - 0.5 * h * fyp( x(i), w(i), 0.5*(w(i+1) - w(i-1))/h );
        end
	end
		

end

