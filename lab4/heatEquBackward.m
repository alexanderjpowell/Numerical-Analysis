function heatEquBackward( )
%initial condition

dx = 0.1;
x = 0:dx:1;
nx = length(x);
nu = 1;
nt = 50;%.0005
dt = 0.01;
c = 1;
tend = nt * dt;

u = zeros(nx, 1);
u = sin(pi * x);
plot(u)
exact_u = exp(-pi^2 * tend) * sin(pi * x);

%u(0.5/dx : 1/dx + 1) = 2;
%plot(u);

frame_counter = 1;
lambda = nu * dt / dx^2;
A = gallery('tridiag', length(u)-2,-lambda,1+2*lambda,-lambda);
for n = 1:nt
    un = u;
    %size(A);
    %size(u(2:nx-1));
    u(2:nx-1) = A \ un(2:nx-1)';
    %for i = 2:nx-1
    %    u(i) = un(i) + nu*dt/dx^2 * (un(i+1) - 2*un(i) + un(i-1));
    %end
    plot(x,u);
    %plot(linspace(0,2,nx),u);
    %axis([0 2 0.5 2]);  % fix the axis so it doesn't change on the for loop
    F(frame_counter) = getframe;
    frame_counter = frame_counter + 1;
end
norm(u - exact_u, inf)


end

