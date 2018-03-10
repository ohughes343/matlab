clear all;
gravity = 6.67e-11; %value of gravitational constant
satmass = 100; %mass of satellite in kg
earthmass = 5.972e32; %mass of earth in kg
earthrad = 63.7e7;%radius of earth in m
earthtomoon = 384e7; %distance from earth to moon in m
time = 100000; %how long sim will run in seconds
stepsize = 1;
steps = time/stepsize; %number of steps that will run

%initial positions
xpos=[8e8]; 
ypos=[8e8];
zpos=[8e8];

%initial velocities
xvel=[4e6]; 
yvel=[-4e6];
zvel=[4e6]; 



r = sqrt((xpos^2) + (ypos^2)+ (zpos^2));

%initial x and y accelerations
xacc(1) = [(-gravity*earthmass*satmass)/(r^3) * (xpos/r)];
yacc(1) = [(-gravity*earthmass*satmass)/(r^3) * (ypos/r)];
zacc(1) = [(-gravity*earthmass*satmass)/(r^3) * (zpos/r)];


figure;
hold on;
rectangle('Position', [-earthrad -earthrad 2*earthrad 2*earthrad], 'Curvature', [1 1]);
daspect([1 1 1]);


%loop each time step
for n=1:stepsize:time
    
   
    %calculate next position
    xpos(n+1) = xpos(n) + xvel(n)*stepsize;
    ypos(n+1) = ypos(n) + yvel(n)*stepsize;
    zpos(n+1) = zpos(n) + zvel(n)*stepsize;

    
    %calculate next velocity
    xvel(n+1) = xvel(n) + xacc(n)*stepsize;
    yvel(n+1) = yvel(n) + yacc(n)*stepsize;
    zvel(n+1) = zvel(n) + zacc(n)*stepsize;

    
    r=sqrt((xpos(n+1))^2 + (ypos(n+1))^2 + (zpos(n+1))^2);
    
        if(r<earthrad)
            disp("Crash!")
        end
        
        if(r>earthtomoon)
            disp("Satellite flew away...")
        end
        
    xacc(n+1) = [(-1)/(satmass) * (gravity*earthmass*satmass)/(r^2) * (xpos(n+1)/r)];
    yacc(n+1) = [(-1)/(satmass) * (gravity*earthmass*satmass)/(r^2) * (ypos(n+1)/r)];
    zacc(n+1) = [(-1)/(satmass) * (gravity*earthmass*satmass)/(r^2) * (zpos(n+1)/r)];


end

comet3(xpos, ypos, zpos);

plot(r)
