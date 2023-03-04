f=@(x) (1/3).*(x.^2).*(sin(3.*x));
x = [-2*pi:2*pi];

%syms c;
%yy = (1/3).*(c.^2).*(sin(3.*c));
%p = diff(yy,'c',1)
%p_a = p(-5.5)
ff=@(c) c.^2.*cos(3.*c) + (2.*c.*sin(3.*c))/3;
p_a = ff(-5.5)
p_2 = myfirst_2order(f,-5.5,0.5)
p_4 = myfirst_4order(f,-5.5,0.5)

plot(x,f(x),"r-","Linewidth",2);
hold on
plot(x,ff(x),"b-","Linewidth",2);

function y = myfirst_2order(f,x,h)
fkk = f(x+h);
fk = f(x-h);
y = (fkk-fk)/(2*h);
end

function y = myfirst_4order(f,x,h)
fk2 = f(x-2*h);
fk = f(x-h);
fkk = f(x+h);
fkk2 = f(x+2*h);
y = (fk2 - 8*fk + 8*fkk - fkk2)/(12*h);
end