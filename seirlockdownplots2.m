%This is a script file to produce Figure 3 in the supplementary 
%information.

gamma=1/4;sigma=1/3;Rzero=2.5;tlockdown=30;epsilon=10^(-4); tend=200;
alphalockdown=1;
[tdet ydet R0eff]=multiseirjackoactivitydetlockdown(gamma, sigma, pactivity, activitypi, Rzero, tlockdown, alphalockdown, epsilon, tend);
alphalockdown=0.8;
[tdet1 ydet1 R0eff1]=multiseirjackoactivitydetlockdown(gamma, sigma, pactivity, activitypi, Rzero, tlockdown, alphalockdown, epsilon, tend);
alphalockdown=0.6;
[tdet2 ydet2 R0eff2]=multiseirjackoactivitydetlockdown(gamma, sigma, pactivity, activitypi, Rzero, tlockdown, alphalockdown, epsilon, tend);
alphalockdown=8/15;
[tdet3 ydet3 R0eff3]=multiseirjackoactivitydetlockdown(gamma, sigma, pactivity, activitypi, Rzero, tlockdown, alphalockdown, epsilon, tend);
figure
plot(tdet,R0eff,tdet1,R0eff1, tdet2, R0eff2, tdet3, R0eff3, 'LineWidth',1)
legend('\alpha=1', '\alpha=.8', '\alpha=0.6', '\alpha=8/15')
hold on
plot(tdet,ones(size(tdet)),'--','LineWidth',1)
xlabel('time t (days)')
ylabel('effective R_0')


