function ret = init()
% creates the initial guess
alpha = 17;
beta = 43/3;
a = 1;
b = 3;
h = 0.1;


N = 19;
out = zeros(N,1);
for i = 1:N
    out(i) = alpha + i * ((beta - alpha)/(b - a)) * h;
end
ret = out;



end

