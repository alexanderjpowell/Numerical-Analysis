function [ average ] = step4( n )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
t = zeros([1,n]);
for i = 1:n
    t(i) = monte_carlo(100000);
end
average = mean(t);


% n = [2,5,10,100,1000,10000,100000];
% e = [0.0205014951, 0.0068778319, 0.0033080843, 0.0013472954, 0.0001338981, 0.0001847004, 0.0000616291];

end

