f=@(x) x.^2-4;
p24 = integral_rectangle(f,2,4,0.01)
t04 = integral_trapezium(f,0,4,0.01)

function [y] = integral_rectangle(fun,a,b,h)
n = a:h:b;
s = 0;
for i = 1:length(n)-1
    s = s+fun(n(i));
end
y=h*s;
end

function [y] = integral_trapezium(fun,a,b,h)
n = a:h:b;
temp = h/2*(fun(n(1))+fun(n(length(n))));
s = 0;
for i = 2:length(n)-1
    s = s+fun(n(i));
end
y=temp+h*s;
end