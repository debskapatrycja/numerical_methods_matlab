x = [0    1.5708    3.1416    4.7124];
y = [0     3     4     1];

x = [0    0.7854    1.5708    2.3562    3.1416    3.9270    4.7124    5.4978];
y= [4.0000    1.2929   -1.0000    1.2929    4.0000    2.7071    1.0000    2.7071];

[A0,A,B] = s_a_app(x,y, 2*pi)

function [A0, A, B] = s_a_app(x,y, T)
N = length(x);
m = (N-2)/2;
om = 2*pi/T;
A0 = 1/N * sum(y);
A=zeros(1,m);
B=zeros(1,m);
for j=1:m
    for i=1:N
        A(j) = A(j) + 2/N*sum(y(i)*cos(2*pi/N*j*(i-1)));
        B(j) = B(j) + 2/N*sum(y(i)*sin(2*pi/N*j*(i-1)));
    end
end
A = A';
B = B';
end