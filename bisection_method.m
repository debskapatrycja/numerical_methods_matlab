format rat
f=@(x) exp(-x)+sin(2*x+(pi/3));
[x1, iter]=bisection(f, 0, 4, 0.01)

function [x1, iter]=bisection(f, a, b, eps)
    iter=1;
    x1=(a+b)/2;
    while abs(f(x1))>eps && abs(b-a)>eps
         if f(a)*f(x1)>0
            a=x1;
         else 
            b=x1;
         end 
        iter=iter+1;
        x1=(a+b)/2;
    end
         if f(a)*f(x1)>0
            a=x1;
         else 
            b=x1;
         end 
        iter=iter+1;
        x1=(a+b)/2;

end