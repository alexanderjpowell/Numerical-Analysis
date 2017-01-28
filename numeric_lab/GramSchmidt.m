function OX = GramSchmidt( X )
%input: column vectors of X.
%output: orthogonal matrix OX.

%First step
OX(:,1) = X(:,1);
[n,m] = size(X);
%Second step
for i = 2:m
    tempOX = zeros(n,1);
    for j = 1:(i-1)
        tempOX = tempOX + proj(OX(:,j),X(:,i));
    end
    OX(:,i) = X(:,i) - tempOX;
end

%Final step..Normalize
% OX = OX/norm(OX);  %this line is incorrect
for i = 1:m
    OX(:,i) = OX(:,i) / norm(OX(:,i));
end


end

function p = proj(u,v)
p = ((u' * v) / (u' * u)) * u;
end