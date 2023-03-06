function [R1, R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out

    file_in = fopen(nume,'r');
    N = fscanf(file_in,"%d",[1 1]); % citire numarul de link-uri
    for i = 1:N
         fscanf(file_in,"%d",[1 1]); % citire indicele nodului 
         nr_vecini = fscanf(file_in,"%d",[1 1]);  % numarul de vecini al indicelui
         for j = 1:nr_vecini
            fscanf(file_in,"%d",[1 1]); % citire vecini
         end
    end
    val1 = fscanf(file_in,"%f",[1 1]); % citire val1
    val2 = fscanf(file_in,"%f",[1 1]); % citire val2 
    fclose(file_in);

    R1 = Iterative(nume, d, eps); % vectorul PageRank folosind metoda iterativa
    R2 = Algebraic(nume, d);      % vectorul PageRank folosind metoda algebraic

    file_out = strcat(nume,".out");
    file = fopen(file_out,'w');
    fprintf(file,"%d\n",N);  % scrierea in fisierul .out a numarul link-urilor
    fprintf(file,"\n");
    fprintf(file,"%f\n",R1); % scrierea in fisierul .out a vectorul de PageRank R1
    fprintf(file,"\n");
    fprintf(file,"%f\n",R2); % scrierea in fisierul .out a vectorul de PageRank R2
    fprintf(file,"\n");

    PR = R2; % vectorul de PageRank R2 ordonat 
    PR_index(1:N,1) = 1:N; % indexii initial pentru fiecare link      
    % implementare Bubble Sort de ordonare
    for i = 1:N
        for j = i+1:N
            % gasire pagina cu probabilitate mai mare => interschimbare
            if PR(j)>PR(i)
                aux = PR(j);
                PR(j) = PR(i);
                PR(i) = aux;

                aux = PR_index(j);
                PR_index(j) = PR_index(i);
                PR_index(i) = aux;
            end
        end
    end

    % scrierea in fisier a indexului curent, indexului initial si u(PR(i)) a fiecarui link 
    for i = 1:N
        fprintf(file,"%d %d %f\n",i,PR_index(i),Apartenenta(PR(i),val1,val2));
    end
    fclose(file);
endfunction