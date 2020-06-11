function [tdet ydet]=multiseirjackoactivitydet(gamma, sigma, pactivity, activitypi, Rzero, epsilon, tend)
%Numerically solves ODEs for multitype SEIR model for age & activity
%structure model.  gamma = 1/(mean infectious period),
%sigma = 1/(mean latent period),  pactivity is a vector containing
%the different activity levels and activitypi is a vector containing
%the fractions of the population having the different activity levels.
%Rzero is the desired R_0. epsilon is the fraction of the different types 
%that are initially infected.  More precisely, it is assumed that for each
%type, a fraction 1-epsilon are susceptible and a fraction epsilon are
%latent (exposed).  The ODE solver produces a solution over the time
%interval [0, tend]. 

%tdet is a vector giving the time points that the solution is given.
%ydet is a matrix, the ith row of which gives the solution at the 
%ith time point.  The second dimension of ydet is 54 as there are 18 
%types in this model.  The first 18 columns give the fractions of the 
%population that are in the different classes and susceptible, the second
%18 columns give the fractions of the population that are in the different
%classes and exposed, and the final 18 rows give the fractions of the 
%population that are in the different classes and infected.  Note that
%these have a different interpretation from the corresponding quantities
%in the supplementary information, which give the corresponding fractions
%of the class rather than of the population.

%The percentaged out material at the end of the code produces the total
%fraction infected and the cumulative total fraction infected during the
%epidemic.

[lambda, vecpi]=jaccomultiactivity(pactivity, activitypi);
r=R0(vecpi,lambda/gamma);
lambda=Rzero/r*lambda;
tspan=[0 tend];
options = odeset('RelTol',1e-7,'AbsTol',1e-7);
y0=[(1-epsilon)*vecpi, epsilon*vecpi, zeros(1,18)];
[tdet ydet]=ode45(@multiseirdydt,tspan,y0,options,lambda,gamma,sigma,18);

%Ydet=ydet';
%figure
%plot(tdet,sum(Ydet((37:54),:)))
%xlabel('time t days')
%ylabel('infectives')
%figure

%plot(tdet,1-sum(Ydet((1:18),:)))
%xlabel('time t days')
%ylabel('cumulative infectives')







    




