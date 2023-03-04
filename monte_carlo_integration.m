rng(42);
fun=@(x) 4-x.^2;

int10_000 = m_c_integration(fun,10000,-2,2)

function [I] = m_c_integration(fun,N,a,b)
k=0;
d = max(fun(a:0.01:b));
for i = 1:N
    x = a+(b-a).*rand();
    y = d.*rand();
    if y<fun(x)
        k = k+1;
    end
end
I = k/N*(b-a)*d;
end