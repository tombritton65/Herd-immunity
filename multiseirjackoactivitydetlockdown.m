function [tdet ydet R0eff]=multiseirjackoactivitydetlockdown(gamma, sigma, pactivity, activitypi, Rzero, tlockdown, alphalockdown, epsilon, tend)
%This is similar code to multiseirjackoactivitydet.m but
%incorporating indefinite lockdown which starts at time tlockdown when all
%infection rates are multiplied by alphalockdown.  As well as saving the
%solution to the ODEs in (tdet,ydet) at each of the time points in tdet it
%saves in R0eff the effective R_0 (incorporating disease-induced immunity)
%if lockdown was fully released (i.e. all rates set back to their original
%values) at that time. 

[lambda, vecpi]=jaccomultiactivity(pactivity, activitypi);
lambdaa=lambda;
r=R0(vecpi,lambda/gamma);
lambda0=Rzero/r;
lambda=Rzero/r*lambda;
tspan=[0 tend];
options = odeset('RelTol',1e-7,'AbsTol',1e-7);
y0=[(1-epsilon)*vecpi, epsilon*vecpi, zeros(1,18)];
[tdet ydet]=ode45(@multiseirdydtA,tspan,y0,options,lambda,gamma,sigma,18 ,tlockdown, alphalockdown);

Ydet=ydet';
%figure
%plot(tdet,sum(Ydet((37:54),:)))
%xlabel('time t days')
%ylabel('infectives')
%figure

%plot(tdet,1-sum(Ydet((1:18),:)))
%xlabel('time t days')
%ylabel('cumulative infectives')


%figure
s=size(tdet);
k=s(1);
for i=1:k
    Lam2=lambda0*lambdaa/gamma*diag(ydet(i,1:18)./vecpi(1:18));
    R0eff(i)=R0(vecpi,Lam2);
end
%k1=find(tdet>30,1);
%plot(tdet(k1:k),R0eff(k1:k));
%plot(tdet, R0eff)



 
   




