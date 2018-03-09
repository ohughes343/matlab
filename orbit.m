clear all;
gravity = 6.67e-11; %value of gravitational constant
satmass = 10; %mass of satellite in kg
earthmass = 5.972e24; %mass of earth in kg
earthrad = 6371;%radius of earth in km
earthtomoon = 384,400; %distance from earth to moon in km
time = 10; %how long sim will run in seconds
stepsize = 1;
steps = time/stepsize; %number of steps that will run

%initial x and y positions
xpos=[0]; 
ypos=[2];

%initial x and y velocities
xvel=[1]; 
yvel=[1];


r = sqrt((xpos.^2) + (ypos.^2));

%initial x and y accelerations
xacc = [(-1)/(satmass) * (gravity*earthmass*satmass)/(r^2) * (xpos/r)];
yacc = [(-1)/(satmass) * (gravity*earthmass*satmass)/(r^2) * (ypos/r)];


figure;
hold on;
rectangle('Position', [0 0 2*earthrad 2*earthrad], 'Curvature', [1 1]);
daspect([1 1 1]);


%loop each time step
for n=1:stepsize:time
    
   
    %calculate next position
    xpos(n+1) = xpos(n) + xvel*stepsize;
    ypos(n+1) = ypos(n) + yvel*stepsize;
    
    %calculate next velocity
    xvel(n+1) = xvel(n) + xacc*stepsize;
    yvel(n+1) = yvel(n) + yacc*stepsize;
    
    r=sqrt(xpos(n+1)^2 + ypos(n+1)^2);
    
    if(r<earthrad)
        disp("Crash!")
    end
    if(r>earthtomoon)
        disp("Satellite flew away...")
    end
        
    xacc = [(-1)/(satmass) * (gravity*earthmass*satmass)/(r^2) * (xpos(n+1)/r)];
    yacc = [(-1)/(satmass) * (gravity*earthmass*satmass)/(r^2) * (ypos(n+1)/r)];
   

end

comet(xpos, ypos);

plot(r)
