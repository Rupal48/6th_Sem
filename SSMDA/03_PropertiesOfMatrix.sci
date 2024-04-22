A = [1,2;3,4];
B = [5,6;7,8];
C = [9,10;11,12];
if (A*B)*C == A*(B*C) then
  disp("Matrix multiplication is associative.");
else
  disp("Matrix multiplication is not associative (error).");
end
if A * B == B * A then
  disp("Matrix multiplication is commutative.");
else
  disp("Matrix multiplication is not commutative.");
end
if A * (B + C) == A * B + A * C then
  disp("Matrix multiplication is distributive over addition.");
else
  disp("Matrix multiplication is not distributive over addition (error).");
end