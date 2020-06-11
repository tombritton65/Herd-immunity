function y=effectR0linearroot(x,vecpi,Lambda,Rzero)
%This program gives the function, f(x) say, whose root is required
%to find the scalar lam described in effectR0linearinf.m
r=R0(vecpi,Lambda);

lambda0=Rzero/r;

Lam1=x*Lambda;
tau=multiSIRtau(vecpi,Lam1);
Lam2=lambda0*Lambda*diag(1-tau);
y=R0(vecpi,Lam2)-1;
    




