function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

    file = fopen(nume,'r');
    N = fscanf(file,"%d",[1 1]); % citire numarul de link-uri
    M = zeros(N,N);  % matrice de adiacenta
    L = zeros(N,N);  % matricea de probabilitati de vizitare a link-urilor
    for i = 1 : N
         x_i = fscanf(file,"%d",[1 1]);        % indicele
         nr_vecini = fscanf(file,"%d",[1 1]);  % numarul de vecini al indicelui
         % citire vecini 
         nr_vec = nr_vecini; % numarul de vecini totali
         for j = 1 : nr_vecini
            vecin = fscanf(file,"%d",[1 1]); 
            if vecin ~= x_i
                M(x_i,vecin) = 1;  % se adauga in matricea de adiacenta legatura 
            else 
                nr_vec = nr_vec-1; % daca vecinul citit este nodul curent, atunci nr. de vecini se micsoreaza 
            end
         end
        % crearea matricei L
        for j = 1 : N
            if M(x_i,j) == 1
                L(x_i,j) = 1/nr_vec;
            end
        end
    end
    fclose(file);

    L = L';
    
    v(1:N,1) = 1; % vector coloana cu 1
    % calculare inversa
    T = PR_Inv(eye(N) - d*L);
    % calculare vector de PageRank
    R = (1-d)/N * T * v; 
end
