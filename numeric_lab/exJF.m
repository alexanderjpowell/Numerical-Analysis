function JF = exJF( x )
x1 = x(1);
x2 = x(2);
x3 = x(3);

JF = [ 3 x3*sin(x2*x3) x2*sin(x2*x3);...
       2*x1 -162*(x2+0.1) cos(x3);...
       -x2*exp(-x1*x2) -x1*exp(-x1*x2) 20];

end

