function JF = exJF( x )
% Exactly calculates the Jacobian matrix of F.  

    x1 = x(1);
    x2 = x(2);
    x3 = x(3);

    JF = [ 3 x3*sin(x2*x3) x2*sin(x2*x3);...
            2*x1 -162*(x2+0.1) cos(x3);...
            -x2*exp(-x1*x2) -x1*exp(-x1*x2) 20];

%{

    a = 1;
    b = 3;
    h = 0.1;
    %N = 20;
    %h = 0.01;
    %N = 200;
    xi = zeros(((b - a)/h) + 1,1);
    N = ((b - a)/h) - 1;
    for i = 1:((b - a)/h + 1)
    %for i = 1:((b-a)/h + 1) + 1
        xi(i,1) = a + (i - 1) * h;
    end
    yi = zeros(((b - a)/h) + 1, 1);
    for j = 1:(length(yi))
    %for j = 1:(length(yi)) + 1
        yi(j,1) = answ_func(xi(j,1));
    end


    %N = length(x);
    JF = zeros(N,N);
    
    for i = 1:N
        for j = 1:N
            if ((i == (j - 1)) && (j >= 2) && (j <= N))
                JF(i,j) = -1 + (h/2) * fyp(x(i),yi(i+1),(yi(i+2)-yi(i)/(2 * h)));
            elseif (i == j)
                JF(i,j) = 2 + (h^2) * fy(x(i),yi(i+1),(yi(i+2)-yi(i)/(2 * h)));
            elseif ((i == j + 1) && (j >= 1) && (j <= (N - 1)))
                JF(i,j) = -1 - (h/2) * fyp(x(i),yi(i+1),(yi(i+2)-yi(i)/(2 * h)));
            else
                JF(i,j) = 0;
            end
        end
    end
    
    %JF = sparse(JF);



%x1 = x(1);
%x2 = x(2);
%x3 = x(3);

%JF = [ 3 x3*sin(x2*x3) x2*sin(x2*x3);...
%       2*x1 -1250*x2 0;...
%       -x2*exp(-x1*x2) -x1*exp(-x1*x2) 20];

%JF = [ 3 x3*sin(x2*x3) x2*sin(x2*x3);...
%       2*x1 -162*(x2+0.1) cos(x3);...
%       -x2*exp(-x1*x2) -x1*exp(-x1*x2) 20];
%}
end

