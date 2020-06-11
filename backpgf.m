function f=backpgf(x,vecpi,lambda)
%Calculates the joint PGF of the backward branching process associated with
%the multitype SIR epidemic described in multiSIRtau.m
s=size(lambda);
k=s(1);
a=vecpi.*(1-x);
f=exp(-a*lambda);


