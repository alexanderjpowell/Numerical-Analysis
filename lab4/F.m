function y = F(x)
% Computes the system of nonlinear equations from the given differential
% equation.
    %x = zeros(20,1);
    y = zeros(length(x),1);
    %y = [];
    
    %PA2
    a = 1;
    b = 3;
    h = 0.1;
    alpha = answ_func(a);
    beta  = answ_func(b);
    %N = 20;
    %h = 0.01;
    %N = 200;
    xi = zeros(((b - a)/h) + 1,1);
    N = ((b - a)/h) - 1;
    for i = 1:((b - a)/h + 1)
        xi(i,1) = a + (i - 1) * h;
    end
    
    yi = zeros(((b - a)/h) + 1, 1);
    for j = 1:(length(yi))
        yi(j,1) = answ_func(xi(j,1));
    end
    
    for k = 1:N
        if (k == 1)
            y(k) = 2 * yi(k+1) - yi(k+2) + (h^2) * func(x(1),yi(k+1),(yi(k+2) - yi(k))/(2 * h)) - alpha;
        elseif (k == N)
            y(k) = (-1) * yi(k) + 2 * yi(k+1) + (h^2) * func(x(N),yi(k+1),(yi(k+2) - yi(k))/(2 * h)) - beta;
        else
            y(k) = (-1) * yi(k) + 2 * yi(k+2) - yi(k+2) + (h^2) * func(x(k),yi(k+1),(yi(k+2) - yi(k))/(2 * h));
        end
    end
    
    %yi
    
    %new = [];
    %for i = 1:length(yi)
        %new(i,1) = answ_func(yi(i,1));
    %    new(i,1) = func(x(i),answ_func(x(i)),2);
    %end
    
    %new
    %yi
    
    %for k = 1:N
    %    if (k == 1)
    %        y(k) = 2 * yi(2) - yi(3) + (h^2) * func(x(1),yi(2),(yi(3) - yi(1))/(2 * h));
    %    elseif (k == N)
    %        y(k) = -1 * yi(N) + 2 * yi(N + 1) + (h^2) * func(x(N),yi(N + 1), );
    %    else
    %    end
    %end
    
    %sp
    %y(1) = 3 * x(1) - cos(x(2) * x(3)) - (1/2);
    %y(2) = x(1)^2 - 81*(x(2) + 0.1)^2 + sin(x(3)) + 1.06;
    %y(3) = exp(-1 * x(1) * x(2)) + 20 * x(3) + ((10 * pi - 3)/3);
    
    %9
    %y(1) = 3 * x(1) - cos(x(2) * x(3)) - (1/2);
    %y(2) = x(1)^2 - 625 * x(2)^2 - (1/4);
    %y(3) = exp(-1 * x(1) * x(2)) + 20 * x(3) + ((10 * pi - 3)/3);
    
    %1d
    %y(1) = 5 * x(1)^2 - x(2)^2;
    %y(2) = x(2) - 0.25 * (sin(x(1)) + cos(x(2)));
    
    %1a
    %y(1) = 4 * x(1)^2 - 20 * x(1) + (1/4) * x(2)^2 + 8;
    %y(2) = (1/2) * x(1) * x(2)^2 + 2 * x(1) - 5 * x(2) + 8;
    
end