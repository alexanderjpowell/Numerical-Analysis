%initialize
a = 1;
b = 3;
alpha = 17;
beta = 43/3;
h = 0.01;

x = 1.1:h:2.9;
N = length(x);
w = zeros( N, 1);
for i = 1:N
    w(i) = alpha + i * (beta - alpha)/(b-a) * h;
end

ww = newton( @(w) F(w, x, alpha, beta, h), @(w) exJF(w, x, alpha, beta, h), w, 1e-15)
