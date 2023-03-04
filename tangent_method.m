format rat
x = [0,8];
f=@(x) exp(-x)+sin(2*x+(pi/3));
[x1, iter, x_all] = tangent_m(f,0,4,0.01,4)

function [x1, iter, x_all] = tangent_m(f, a, b, eps, x0)
x_all = [];
iter = 1;
while iter>0
    fp = integration(f,x0,0.1);
    x1 = x0 - f(x0)/fp;
    fx = f(x1);
    x_all(iter) = x1;
    if abs(fx) < eps
        break;
    else
        x0 = x1;
    end
    iter = iter+1;
end
end

function [y] = integration(g,x,h)
fk2 = g(x-2*h);
fk = g(x-h);
fkk = g(x+h);
fkk2 = g(x+2*h);
y = (fk2 - 8*fk + 8*fkk - fkk2)/(12*h);
end