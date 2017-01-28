function JF = testJF( x )
% Exactly calculates the Jacobian matrix of F.  

x1 = x(1);
x2 = x(2);
x3 = x(3);

JF = [3*x1-x3,x1^2,-1*x1;exp(x1),exp(x2),-1;-2*x3,2*x2,-2*x1];

%JF = [ 3 x3*sin(x2*x3) x2*sin(x2*x3);...
%       2*x1 -162*(x2+0.1) cos(x3);...
%       -x2*exp(-x1*x2) -x1*exp(-x1*x2) 20];

end

