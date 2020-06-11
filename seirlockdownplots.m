%This is a script file to produce Figures 1 and 2 of the paper.  

gamma=1/4;sigma=1/3;Rzero=2.5;tlockdown1=30;alphalockdown=.8; tlockdown2=135; alphalockdown2=1;epsilon=10^(-4); tend=255;
pactivity=[.5 1 2]; activitypi=[.25 .5 .25];
[tdet ydet]=multiseirjackoactivitydet(gamma, sigma, pactivity, activitypi, Rzero, epsilon, tend);
alphalockdown1=0.8;
[tdet1 ydet1]=multiseirjackoactivitydetlockdown2(gamma, sigma, pactivity, activitypi, Rzero, tlockdown1, alphalockdown1, tlockdown2, alphalockdown2, epsilon, tend);
alphalockdown1=0.6;
[tdet2 ydet2]=multiseirjackoactivitydetlockdown2(gamma, sigma, pactivity, activitypi, Rzero, tlockdown1, alphalockdown1, tlockdown2, alphalockdown2, epsilon, tend);
alphalockdown1=8/15;
[tdet3 ydet3]=multiseirjackoactivitydetlockdown2(gamma, sigma, pactivity, activitypi, Rzero, tlockdown1, alphalockdown1, tlockdown2, alphalockdown2, epsilon, tend);
Ydet=ydet';Ydet1=ydet1';Ydet2=ydet2';Ydet3=ydet3';
figure
plot(tdet,sum(Ydet((37:54),:)), tdet1,sum(Ydet1((37:54),:)),tdet2,sum(Ydet2((37:54),:)),tdet3,sum(Ydet3((37:54),:)),'LineWidth', 1)
legend('\alpha=1', '\alpha=.8', '\alpha=0.6', '\alpha=8/15')
axis([0 255 0 0.1])
xlabel('time days')
ylabel('infectives')
figure
plot(tdet,1-sum(Ydet((1:18),:)),tdet1,1-sum(Ydet1((1:18),:)),tdet2,1-sum(Ydet2((1:18),:)),tdet3,1-sum(Ydet3((1:18),:)),'LineWidth', 1)
axis([0 255 0 0.8])
legend('\alpha=1', '\alpha=.8', '\alpha=0.6', '\alpha=8/15', 'Location', 'NorthWest')
xlabel('time days')
ylabel('cumulative infectives')