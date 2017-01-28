function out = func(x,y,yp)
% This function models the originial differential equation.  
    out = (1/8) * (32 + 2 * x^3 - y * yp);
end