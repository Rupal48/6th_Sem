m = input("Enter the number of rows : ")
n = input("Enter the number of cols : ")

disp("Enter the elemets of the matrixx row by row : ")
A = zeros(m,n);
for i = 1:m
    for j = 1:n
        A(i,j) = input("Enter element A(" + string(i) + ',' + string(j) + "): ");
    end
end

R = rref(A);

disp("Reduced row echleon form: ");
disp(R);