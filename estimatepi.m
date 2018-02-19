for r=10:100:10000      %loop through lots of values for size of the circle
    area=0;
    error = 0;                    %reset area, error, and time elapsed
    tic
    
    for x=-r:r                    %run through x and y values 
        for y=-r:r
             if(sqrt(x^2 + y^2) <= r) %if both x and y are inside the circle, add 1 to the area
                area = area+1;

             end
        end
    end
    pie = area/(r^2);
    error(r) = (pie - pi)/pi;    %error in each row
    disp(pie);
    radius(r) = r;
    elapsedTime(r) = toc;
    
   
    
   
end
yyaxis left
title('Relative error and computation time vs r value')
xlabel('Radius of Circle')
ylabel('Error')
plot(radius,error); hold on

yyaxis right
ylabel('Computation Time (seconds)')

plot(radius,elapsedTime)
