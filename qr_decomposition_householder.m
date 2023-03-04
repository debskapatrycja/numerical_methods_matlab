A = [[-1 -1  1]
     [ 1  3  3]
     [-1 -1  5]
     [ 1  3  7]];
[Q R] = qr_ht(A)

function [Q R] = qr_ht(A)
    Q = eye(max(size(A)));
    R = A;
    for k=1:size(A, 2)
        Ak = R(k:end, k:end);
        ak = Ak(:, 1);
        e = zeros(length(ak), 1);
        e(1) = 1;
        vk = ak + sign(Ak(1, 1)) * norm(ak) * e;
        Hk = eye(max(size(A)));
        hk = eye(length(vk)) - 2 * ((vk * vk') / (vk' * vk));
        for i=k:max(size(A))
           for j=k:max(size(A))
               Hk(i, j) = hk(i - k + 1, j - k + 1);
           end
        end
        R = Hk * R;
        Q = Q * Hk;
    end
end