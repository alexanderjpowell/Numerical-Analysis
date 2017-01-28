%Lab3, low rank approximation
%https://inst.eecs.berkeley.edu/~ee127a/book/login/l_svd_low_rank.html


%read the image and store it as an integer matrix
lena = imread('lena512.bmp'); 

%double transforms matrix into floating type, since svd only performs on floating number.
%Compute the svd decomposition.
[U, S, V] = svd( double(lena) );

%Print the singular values
sv = diag(s);
plot( sv );
semilogy( sv, 'ro');

%Explained variance
EV = sum( sv(1:10) ) / sum(sv);

%Low rank approximation
lenak = u(:,1:200)*s(1:200,1:200)*v(:,1:200)';

%Show the picture
imshow( unit8(lenak) );
