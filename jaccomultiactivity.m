function [lambda, vecpi]=jaccomultiactivity(pactivity, activitypi)
%This program calculates, for the model with different activity levels,
%the infection contact rate matrix Lambda
%(this is the matrix A in the supplementary information) and the vector
%vecpi giving the fractions of the population in different age groups 
%from the data in Wallinga et al (2006).  pactivity is a vector containing
%the different activity levels and activitypi is a vecctor containing
%the fractions of the population having the different activity levels.
%If the age types are denoted by 
%(A1, A2, A3, A4, A5, A6) and the activity types by (L, M, H) then the 18
%types in e.g. vecpi are ordered 
%(A1L, A1M, A1H, A2L, A2M, A2H,..., A6L, A6M, A6H).

C=[12.26 2.72 2.00 11.46 3.59 1.94;
    2.28 23.77 3.63 11.58 4.67 1.95;
    1.29 2.80 25.20 16.87 8.50 2.54;
    2.50 3.02 5.70 25.14 11.21 4.25;
    1.15 1.78 4.22 16.43 13.89 5.59;
    0.83 1.00 1.68 8.34 7.48 9.19];
n=[1059615 1265232 1642498 4856598 3312499 2477327];
vecpia=n/sum(n);
lambdaa=C/diag(vecpia);
P=pactivity'*pactivity;
lambda= kron(lambdaa,P);
vecpi=kron(vecpia,activitypi);
