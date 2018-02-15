function P=birthday_prob(n)
    P = 1;
    for i = 2:n
        P = P*(365-i)/365;
    end
    P = 1-P;
