function [ integral ] = monte_carlo( N )

a = zeros([1,N]);
for i = 1:N  
    a(i) = 2*rand - 1;
end

b = zeros([1,N]);
for i = 1:N  
    b(i) = 2*rand - 1;
end
x = a;
y = b;

temp = zeros([1,N]);

for j = 1:N
    if ((x(j).^2 + y(j).^2) < 1)
        temp(j) = 1;
    else
        temp(j) = 0;
    end
end
c = temp;

total = sum(c);
integral = 4.*(1/N).*(total);
end