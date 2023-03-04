format rat
f=@(x) exp(-x)+sin(2*x+(pi/3));
%f=@(x) x.^2 - 3;
[x1,iter] = regula_falsi(f,0,4,0.01)
%[x1,iter] = regula_falsi(f,0,8,0.1)

function [x1, iter] = regula_falsi(f, a, b, eps)
x1 = a - f(a)*((b-a)/(f(b)-f(a)));
iter = 0;
while abs(f(x1))>eps
    x1 = a - f(a)*((b-a)/(f(b)-f(a)));
    iter = iter+1;
    if f(x1)*f(a)>0
        a = x1;
    elseif f(x1)*f(a)<0
        b = x1;
    end
end
end