clear all;
gravity = 6.67e-11; %value of gravitational constant
time = 10; %how long sim will run in seconds
stepsize = 1;
steps = time/stepsize; %number of steps that will run


x = 0:.1:1;
y = 0:.1:1;
r = sin(x.^2) + cos(y.^2);
plot(r)
