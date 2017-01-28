function bergerP3( )
%initial condition

%dx = 0.1;
nx = 101;
dx = (2*pi)/(nx-1);
%x = 0:2*pi:nx;
x = 0:dx:2*pi;
%length(x);
nx = 101;  %length(x);
nu = .07;
nt = 100;
dt = dx * nu;
%c = 1;
%tend = nt * dt;
t = 0;


phi = exp((-x.^2)/4*nu) + exp((-(x - 2*pi).^2)/(4*nu));

for i = 1:length(phi)
    partial(i) = (-x(i))/(2*nu) * exp((-x(i)^2)/(4*nu)) - ((x(i)-2*pi)/(2*nu)) * exp((-(x(i)-2*pi)^2)/(4*nu));
end

u = zeros(nx, 1);
%u = sin(pi * x);

for i = 1:length(x)
    u(i) = ((-2*nu)/(exp((-x(i)^2)/(4*nu)) + exp((-(x(i)-2*pi)^2)/(4*nu))) * ((-x(i))/(2*nu) * exp((-x(i)^2)/(4*nu) - (x(i)-2*pi)/(2*nu)*exp((-(x(i)-2*pi)^2)/(4*nu))))+4);
end


%for i = 1:length(phi)
%    u(i) = -2*(nu)/phi(i) * partial(i) + 4;
%end

%u = -2*(nu)/phi * partial + 4;
plot(u)
%exact_u = exp(-pi^2 * tend) * sin(pi * x);
for i = 1:length(phi)
    exact_u = exp((-(x(i) - 4 * t)^2)/4 * nu * (t+1)) + exp((-(x(i)-4 * t-2 * pi)^2)/(4 * nu * (t+1)));
end

%u(0.5/dx : 1/dx + 1) = 2;
%plot(u);

frame_counter = 1;
for n = 1:nt
    un = u;
    for i = 2:nx-1
        %this line from previous lab
        %u(i) = un(i) + nu*dt/dx^2 * (un(i+1) - 2*un(i) + un(i-1)) - un(i) * (dt/dx) * (un(i) - un(i-1));
        % end here
        
        u(i) = un(i) - un(i) * dt/dx * (un(i) - un(i-1)) + nu * (dt/(dx^2)) * (un(i+1)-2*un(i)+un(i-1));
        
        %u(-1) = un(-1) - un(-1) * dt/dx * (un(-1) - un(-2)) + nu * (dt/(dx^2)) * (un(0) - 2 * un(-1) + un(-2));
        
    end
    length(u);
    length(un);
    u(101) = un(101) - un(101) * dt/dx * (un(101) - un(100)) + nu * (dt/(dx^2)) * (un(1) - 2 * un(101) + un(100));
    u(1) = u(101);
    plot(linspace(0,2,nx),u);
    axis([0 2 0 7]);  % fix the axis so it doesn't change on the for loop
    F(frame_counter) = getframe;
    frame_counter = frame_counter + 1;
end
norm(u - exact_u, inf)

end

