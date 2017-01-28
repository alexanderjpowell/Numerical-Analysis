function LinearConvection( )
%initial condition
nx = 41;
%nx = 41;
dx = 2 / (nx - 1);
nt = 25; %250 for nonlin
dt = 0.025; %0.0025 for nonlin
c = 1;
lamda = abs(c * dt/dx)
u = ones(nx, 1);
u(0.5/dx : 1/dx + 1) = 2;
plot(u);

frame_counter = 1;
for n = 1:nt
    un = u;
    for i = 2:nx-1
        u(i) = un(i) - c * (dt/dx) * (un(i) - un(i-1));
    end
    plot(linspace(0,2,nx),u);
    F(frame_counter) = getframe;
    frame_counter = frame_counter + 1;
end

end

