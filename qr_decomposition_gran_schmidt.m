A = [[-1 -1 1]
     [ 1  3 3]
     [-1 -1 5]
     [ 1  3 7]];
[Q R] = qr_gs(A)

function [Q R] = qr_gs(A)
    R = zeros(min(size(A)));
    Q = zeros(size(A));

    for k=1:size(A, 2)
        for i=1:k-1
            R(i, k) = Q(:, i)' * A(:, k);
        end
        
        qd = A(:, k);
        for i=1:k-1
            qd = qd - R(i, k) * Q(:, i);
        end
        R(k, k) = norm(qd);
        Q(:, k) = qd / R(k, k);
    end
end