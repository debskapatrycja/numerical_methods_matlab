%format rat;

x = [-2,-1,0,1,2];
y = [4,1,0,1,4];
m = sq_appr(x,y)

x = [-3 ,  -2,    -1,     0 ,    1,     2,     3];
y = [-13.5092,   15.0143,   15.6399,   11.9732,    2.1204,    7.1199,   22.1617];
m3 = sq_appr_d(x,y,3)


function [v] = sq_appr(x,y)
    d = y';
    G = ones(length(x),3);
    G(:,2) = x';
    G(:,3) = (x.*x)';
    T = G'*G;
    T = T^-1;
    G = G'*d;
    v = T*G;
end

function [v] = sq_appr_d(x,y,s)
    d = y';
    G = ones(length(x),s+1);
    for i=2:s+1
        G(:,i) = (x.^(i-1))';
    end
    T = G'*G;
    T = T^-1;
    G = G'*d;
    v = T*G;
end
