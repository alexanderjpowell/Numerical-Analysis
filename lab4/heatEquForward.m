function heatEquForward( )


dx = 0.4;
x = 0:dx:2;
nx = length(x);
nu = 1;
nt = 50; %.0005
dt = 0.01;
c = 1;
tend = nt * dt;

u = zeros(nx, 1);
u = sin(2 * pi * x);
%plot(u)
exact_u = exp(-1 * 4 * pi^2 * tend) * sin(2 * pi * x);


%u(0.5/dx : 1/dx + 1) = 2;
%plot(u);

%frame_counter = 1;
for n = 1:nt
    un = u;
    for i = 2:nx-1
        u(i) = un(i) + nu*dt/dx^2 * (un(i+1) - 2*un(i) + un(i-1));
        u(i)
    end
    
    %plot(linspace(0,2,nx),u);
    %axis([0 2 0.5 2]);  % fix the axis so it doesn't change on the for loop
    %F(frame_counter) = getframe;
    %frame_counter = frame_counter + 1;
end
norm(u - exact_u, inf)




%{
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
%plot(u)
exact_u = exp(-pi^2 * tend) * sin(pi * x);


%u(0.5/dx : 1/dx + 1) = 2;
%plot(u);

%frame_counter = 1;
for n = 1:nt
    un = u;
    for i = 2:nx-1
        u(i) = un(i) + nu*dt/dx^2 * (un(i+1) - 2*un(i) + un(i-1));
    end
    
    %plot(linspace(0,2,nx),u);
    %axis([0 2 0.5 2]);  % fix the axis so it doesn't change on the for loop
    %F(frame_counter) = getframe;
    %frame_counter = frame_counter + 1;
end
norm(u - exact_u, inf)
%}

end

