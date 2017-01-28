function heatEqu( )
%initial condition
nx = 41;
%nx = 41;
dx = 2 / (nx - 1);
nu = 0.3;
nt = 500; %250 for nonlin
sigma = 0.2;
dt = sigma * dx^2 / nu;
c = 1;
lamda = abs(c * dt/dx);
u = ones(nx, 1);
u(0.5/dx : 1/dx + 1) = 2;
plot(u);

frame_counter = 1;
for n = 1:nt
    un = u;
    for i = 2:nx-1
        u(i) = un(i) + nu*dt/dx^2 * (un(i+1) - 2*un(i) + un(i-1));
    end
    plot(linspace(0,2,nx),u);
    axis([0 2 0.5 2]);  % fix the axis so it doesn't change on the for loop
    F(frame_counter) = getframe;
    frame_counter = frame_counter + 1;
end



end

