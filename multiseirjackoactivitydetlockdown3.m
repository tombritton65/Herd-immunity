function [tdet ydet]=multiseirjackoactivitydetlockdown3(gamma, sigma, pactivity, activitypi, Rzero, tlockdown1, alphalockdown1, tlockdown2, tlockdown3, epsilon, tend)
%This is the equivalent code to multiseirjackoactivitydet.m but
%incorporating lockdown followed by gradual relaxation of lockdown, 
%details of which are given in multiseirdydtC.

[lambda, vecpi]=jaccomultiactivity(pactivity, activitypi);
r=R0(vecpi,lambda/gamma);
lambda=Rzero/r*lambda;
tspan=[0 tend];
options = odeset('RelTol',1e-7,'AbsTol',1e-7);
y0=[(1-epsilon)*vecpi, epsilon*vecpi, zeros(1,18)];
[tdet ydet]=ode45(@multiseirdydtC,tspan,y0,options,lambda,gamma,sigma,18 ,tlockdown1, alphalockdown1, tlockdown2, tlockdown3);

%Ydet=ydet';
%figure
%plot(tdet,sum(Ydet((37:54),:)))
%xlabel('time t days')
%ylabel('infectives')
%figure

%plot(tdet,1-sum(Ydet((1:18),:)))
%xlabel('time t days')
%ylabel('cumulative infectives')






    




