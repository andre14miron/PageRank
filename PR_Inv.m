function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare

    [n, ~] = size(A);
    Q = zeros(n); % matrice ortogonala
    R = zeros(n); % matrice superior triunghiulara
    % Algoritmul Gram-Schmidt
    for i = 1 : n
        R(i,i) = norm(A(1:n,i));
        Q(1:n,i) = A(1:n,i) / R(i,i);
        for j = i+1:n
            R(i,j) = (Q(1:n,i)') * A(1:n,j);
            A(1:n,j) = A(1:n,j) - Q(1:n,i) * R(i,j);
        end
    end
    
    
    Q = Q';

    %Pentru rezolvarea sistemelor de ecuatii, folosim pentru fiecare SST
    B = zeros(n,n);
    for k = 1 : n
        x = zeros(n,1);      % solutia sistemului
        b(1:n,1) = Q(1:n,k); % extragem coloana k din Q
        for i = n : -1 : 1
            x(i) = (b(i) - R(i,i+1:n) * x(i+1:n))/R(i,i);
        end
        B(1:n,k) = x; % x devine coloana k din B
    end
    
end