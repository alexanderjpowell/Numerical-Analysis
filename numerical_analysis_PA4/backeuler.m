function [t, w] = backeuler(f,dfdy,a,b,alpha,N,maxiter,tol)
h = (b - a)/N;
y = zeros(N,1);
ti = zeros(N,1);
y(1) = alpha;
ti(1) = a;
for i = 1:N
    th = ti(i) + h;
    init = y(i);
    f1 = @(x) x - init - h.*f(th,x);
    dfdy1 = @(x) 1 - h.*dfdy(th,x);
    y(i+1) = newton(f1,dfdy1,init,tol,maxiter);
    ti(i+1) = th;
end
t = ti;
w = y;
end