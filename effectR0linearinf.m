function [inf totinf]=effectR0linearinf(vecpi,Lambda,Rzero)
%Considers a multitype SIR epidemic having infection contact rate matrix Lambda
%(this is the matrix A in the supplementary information) 
%assuming all infectives have mean infectious period 1.  (vecpi contains the
%fractions of the population of the different types.) It first calculates
% the value of  the scalar lambda0 so that the epidemic with infection rate matrix
%lambda0*Lambda has R_0 equal to the desired Rzero.  It then determines
%the value of the scalar lam, so that if the epidemic with infection rate
%matrix Lam1=lam*Lambda is run to its conclusion and then the epidemic with
%infection rate matrix lambda_0*Lambda is run on the remaining susceptible
%population, the latter has R_0=1.  (Thus alpha_* in the paper is given by
%lam/lambda0.) the vector inf gives the fractions of the different types that are
%infected by the first epidemic and totinf is the total fraction infected by the
%first epidemic.  This program is used to produce the h_D values in Table 1
%and Table 2 of the paper.
r=R0(vecpi,Lambda);
lambda0=Rzero/r;
lambdac=1/r;
lam=fzero(@effectR0linearroot,[lambdac lambda0],[],vecpi,Lambda,Rzero);
Lam1=lam*Lambda;
inf=multiSIRtau(vecpi,Lam1);
totinf=inf*vecpi';





    




