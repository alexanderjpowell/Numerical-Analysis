function y = testF(x)
% Computes the system of nonlinear equations from the given differential
% equation.
    %x = zeros(20,1);
    y = zeros(length(x),1);
    %y = [];
    
    y(1) = x(1)^3 + x(1)^2 * x(2) - x(1) * x(3) + 6;
    y(2) = exp(x(1)) + exp(x(2)) - x(3);
    y(3) = x(2)^2 - 2 * x(1) * x(3) - 4;
    
    
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