function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
    
    file = fopen(nume,'r');
    N = fscanf(file,"%d",[1 1]); % citire numarul de link-uri
    M = zeros(N,N);  % matrice de adiacenta
    L = zeros(N,N);  % matricea de probabilitati de vizitare a link-urilor
    for i = 1 : N
         x_i = fscanf(file,"%d",[1 1]);        % indicele nodului
         nr_vecini = fscanf(file,"%d",[1 1]);  % numarul de vecini al nodului citit
         % citire vecini 
         nr_vec = nr_vecini;  % numarul de vecini totali 
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
    L=L';
    
    %initializarea vectorului de PageRank
    R1(1:N,1) = 1/N;
    ok=1;
    % procedeul continua cat timp eroarea este mai mica decat diferenta
    % ultimelor 2 vectori de PageRank creati
    while ok == 1
        R2 = d*L*R1 + (1-d)/N*ones(N,1); %noul vector de PageRank
        if abs(R2-R1) < eps 
                ok = 0;
        end
        R = R1;
        R1 = R2;
    end
end