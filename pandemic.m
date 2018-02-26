%x is proportion of infected population (from 0 to 1)
%t = transmission rate - if t=3 and x(n)=.2, then x(n+1) will equal .6
%s = disease survival rate - 
%x(n+1) = x(n) * t

%P is some factor of t and s
%x(n+1) = P * x(n) * (1-x(n))
clear all;


%for p=4
    p=3.6
    h(1) = .1;
    for g=1:50
        h(g+1) = p * h(g) * (1-h(g)) - .001;
        %p=3*rand + 1;
    end
    %figure();
    
    plot(h)
    xlabel("Weeks");
    ylabel("Percent Infected");
    title("Diseased Population vs. Time");
    hold on
    

%end


