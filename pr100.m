%outputs every prime number below 100
y=0;
for x=1:1000
    if isprime(x)
        if ~isprime(x+2) && ~isprime(x-2)
            y=y+1;
        end
    end
end
y
