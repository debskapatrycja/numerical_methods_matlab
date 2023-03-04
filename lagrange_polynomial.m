x = [1,2,3];
y = [0,1,4];
iks = [1,1.5];
iksCheck = [2:0.1:4];

%lagrange_polynomial_fun(x,y,iks);
lagrange_polynomial_fun(x,y,iksCheck);

sum_igrek = sum(lagrange_polynomial_fun(x,y,iksCheck))

function [igrek] = lagrange_polynomial_fun(x,y,iks)

igrek = zeros(1,length(iks));

for p=1:length(iks)
    
    for i=1:length(x)
        
        nominator = 1;
        denominator = 1;
        
        for k=1:length(x)
            if k==i
                continue;
            end
            nominator = nominator * (iks(p) - x(k));
        end
        for k=1:length(x)
            if k==i
                continue;
            end
            denominator = denominator * (x(i) - x(k));
        end
        igrek(p) = igrek(p) + y(i)*(nominator/denominator);
    end
end
x,y,iks,igrek
end