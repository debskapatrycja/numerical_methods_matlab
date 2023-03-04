A=[1,4,2,-2;1,6,1,-1;-1,0,0,5;3,6,9,8];

LU_decomposition(A);
lu(A)
[l,u]=LU_decomposition(A);
det_LU(l,u);
det(u)

function [L,U] = LU_decomposition(A)
[n,n]=size(A);
L = zeros(n,n);
U = zeros(n,n);
for i=1:n
    for j=1:i-1
        L(i,j)=A(i,j);
        for k=1:j-1
            L(i,j) = L(i,j)/L(i,k)*U(k,j);
        end
        L(i,j)=L(i,j)/U(j,j);
    end
    for j=i:n
        U(i,j)=A(i,j);
        for k=1:i-1
            U(i,j)=U(i,j)-U(k,j)*L(i,k);
        end
    end
    for i=1:n
        L(i,i)=1;
    end
end
L,U
end

function [determinant] = det_LU(L,U)
[n,n]=size(L);
determinant=1;
for i=1:n
    determinant=determinant*U(i,i);
end
determinant
end