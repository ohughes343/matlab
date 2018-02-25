%x is proportion of infected population (from 0 to 1)
%t = transmission rate 
%s = disease survival rate
%x(n+1) = x(n) * t

%P is some factor of t and s
%x(n+1) = P * x(n) * (1-x(n))
clear all;

%just using the first model; only care about transmission rate
t=3.03;
x(1) = 1;
for n=1:100
    x(n+1)= t * x(n); %pretty clear model of 3^n
end
plot(x, 'r--')
hold on 


y(1) = 80;
s=2;
%model of survival rate;  y(m+1) = s * (1-y(m))
for m=1:100
    y(m+1) = s * (1-y(m));
end
plot(y, 'k-')
