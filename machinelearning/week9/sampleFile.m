B = [1,2,3,4,5;6,7,8,9,10;11,12,13,14,15];
A = B';
C = A * B;
R = eye(5)
total = 0;
for i = 1:5
    for j = 1:5
     if (R(i,j) == 1)
        total = total + C(i,j);
     end
    end
end
total

total = sum(sum((A * B) .* R))
C = A * B; 
total = sum(sum(C(R == 1)))
C = (A * B) * R;
total = sum(C(:))
% total = sum(sum(A(R == 1) * B(R == 1))