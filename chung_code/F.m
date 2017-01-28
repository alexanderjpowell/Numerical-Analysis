function y = F(w, x, a, b, h)
    y = zeros(length(w),1);
	N = length(w);
	y(1) = 2*w(1) - w(2) + h^2 * ff(x(1), w(1), (w(2) - a)/(2*h)) - a;
	for i = 2:N-1
		y(i) = -w(i-1) + 2*w(i) - w(i+1) + h^2 * ff(x(i), w(i), (w(i+1) - w(i-1))/(2*h));
	end
	y(N) = -w(N-1) + 2*w(N) + h^2 * ff(x(N), w(N), (b - w(N-1))/(2*h)) - b;
end

function out = ff(x, y, yp)
	out = (32 + 2*x^3 - y * yp)/8;
end
