function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1

    % calcularea valorilor a si b astfel incat functia sa fie continua
    a = 1/(val2 - val1);
    b = -a * val1;

    % calculare u(x)
    if(x < val1)              
        y = 0;
    end
    if(val1 <= x && x <= val2)
        y = a*x+b;
    end
    if(x > val2)
        y = 1;
    end
end

	