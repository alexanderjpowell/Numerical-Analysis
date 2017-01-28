function sol = BVD( func, tol )
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
a = 1;
b = 3;
h = 0.1;
N = 19;
alpha = 17;
beta = 14/3;

%MAX iterations
M = 500;

wi = zeros(N,1);
for i = 1:N
    wi(i) = alpha + i * ((beta - alpha)/(b - a)) * h;
end

k = 1;

while (k <= M)
    %step 5
    x = a + h;
    t = (wi(2) - alpha)/(2*h);
    ai(1) = 2 + (h^2) * fy(x,wi(1),t);
    bi(1) = -1 + (h/2) * fyp(x,wi(1),t);
    di(1) = -1 * (2 * wi(1) - wi(2) - alpha + (h^2) * func(x,wi(1),t));
    
    %step 6
    for i = 2:(N-1)
        x = a + i * h;
        t = (wi(i+1) - wi(i-1))/(2 * h);
        ai(i) = 2 + (h^2) * fy(x,wi(i),t);
        bi(i) = -1 + (h/2) * fyp(x,wi(i),t);
        ci(i) = -1 - (h/2) * fyp(x,wi(i),t);
        di(i) = -1 * (2 * wi(i) - wi(i+1) - wi(i-1) + (h^2) * func(x,wi(i),t));
    end
    
    %step 7
    x = b - h;
    t = (beta - wi(N-1))/(2 * h);
    ai(N) = 2 + (h^2) * fy(x,wi(N),t);
    ci(N) = -1 - (h/2) * fyp(x,wi(N),t);
    di(N) = -1 * (2 * wi(N) - wi(N-1) - beta + (h^2) * func(x,wi(N),t));
    
    %step 8
    li(1) = ai(1);
    ui(1) = (bi(1))/(ai(1));
    zi(1) = (di(1))/(li(1));
    
    %step 9
    for i = 2:(N-1)
        li(i) = ai(i) - ci(i) * ui(i-1);
        ui(i) = (bi(i))/(li(i));
        zi(i) = (di(i) - ci(i) * zi(i-1))/(li(i));
    end
    
    %step 10
    li(N) = ai(N) - ci(N) * ui(N-1);
    zi(N) = (di(N) - ci(N) * zi(N-1))/(li(N));
    
    %step 11
    vi(N) = zi(N);
    wi(N) = wi(N) + vi(N);
    
    %step 12
    for i = (N-1):1
        vi(i) = zi(i) - ui(i) * vi(i+1);
        wi(i) = wi(i) + vi(i);
    end
    
    %step 13
    if (norm(vi) <= tol)
        %step 14
        %for i = 0:(N+1)
        %    x = a + i * h;
        %    fprintf('x = %d, w = %d\n', x, wi(i+1));
        %end
        x
        wi
        
        %step 15
        fprintf('The procedure was successful.  \n');
        break;
    end
    
    %step 16
    k = k + 1;
    
end

%step 17
%fprintf('Maximum number of iterations exceeded: %d.  \n', k);
%fprintf('The procedure was unsuccessful.  \n');


end

