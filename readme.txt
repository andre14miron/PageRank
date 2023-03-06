// Copyright 314CC Miron Andreea Cristiana

Metode numerica

Tema #1
In spatele unui... Motor de cautare

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	In cadrul acestei teme au fost utilizate 5 fisiere: Algebraic.m, 
Apartenenta.m, Iterative.m, PageRank.m si PR_Inv. Scopul temei este realizarea
unor vectori de PageRank prin 2 metode diferite: Iterativ si Algebraic.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PageRank

	Functia centrala este reprezentata de PageRank, din care rezulta 
fisierul de iesire. Se deschide fisierul de intrare primit ca parametru in
functie si se citesc valorile pentru N(numarul de link-uri), val1 si val2.
Pentru a afla valorile val1 si val2 a fost nevoit sa citim si indicii, numarul
de vecini si vecinii pentru fiecare element, insa nu au o importanta in cadrul
acestei functii. Dupa citire se salveaza in vectorii R1 si R2 vectorii de 
PageRank rezultat in urma apelarii functiilor Iterativa si Algebraic. Se 
afiseaza numarul de link-uri si vectorii de PageRank. Pentru sortarea celui
de-al doilea vector de PageRank am copiat vectorul in unul nou PR si am creat
un vector de indexi. Pentru ordonare am implementat Bubble Sort. In continuare
am scris in fisierul de iesire noul index, indexul initial si F, unde F este
u(PR(i)), calculat cu ajutorul functiei Apartenenta.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Apartenenta

	Functia primeste ca parametrii x, val1, val2 si calculeaza valoarea 
functiei membru in punctul x. Pentru aflarea valorilor a si b s-au gasit 
formule in functie de val1 si val2, prin rezolvarea problemelor de 
discontinuitate a functiei. Functia fiind continua, se poate calcula u(x) prin
incadrarea lui x in intervalul in care se afla si asocierea noii valori 
corespunzatoare.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Iterative

	Se deschide fisierul al carui nume a fost primit ca parametru si se
citeste numarul de link-uri N. Am intializat matricea de adiacenta M si 
matricea de probabilitati de vizitare a link-urilor L. Pentru fiecare link s-a 
indicele, numarul de vecini si vecinii. Pentru fiecare vecin citit s-a 
verificat sa nu fie nodul insusi pentru a nu crea legatura cu el insusi si
pentru a decrementa numarul total de vecini al acestuia. Altfel, s-a creat
legatura intre nod si vecinul lui prin marcarea in matricea de adiacenta cu 1.
Dupa citirea vecinilor unui nod, se formeaza si coloana asociata nodului din L.
	Vectorul de PageRank este initializat cu 1/N pentru fiecare element.
Se calculeaza R(t+1) (reprezentat de R2) cat timp diferenta dintre R2 si R1
este mai mica decat epsilon. La fiecare bucla din while se salveaza in R R1
si in R1 R2. 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Algebraic

	Citirea este acceasi ca la functia Iterative. Functia se bazeaza pe 
simple calcule precum in aflarea inversului lui I-d*L prin apelarea functiei 
PT_Inv si calcularea efectiva a vectorului de PageRank.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PR_Inv

	Functia calculeaza inversa matricii A folosind factorizarea 
Gram-Schmidt. Factorizarea Gram-Schmidt este luata din laboratorul de Metode
numerice. Se aplica algoritmul Gram-Schmidt matricei A. Pentru calcularea
inversei s-a aflat urmatoarea ecuatie: A*B=I <=> Q*R*B=I <=> R*B=Qt, unde
B este inversa lui A. Astfel, s-a ajuns la problema rezolvarii a unor sisteme
de ecuatii. Pentru fiecare sistem s-a aplicat algoritmul SST. 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  