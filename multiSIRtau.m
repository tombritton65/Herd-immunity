function tau=multiSIRtau(vecpi,lambda)
%calculates the final fractions infected of the different types in a 
%multitype SIR epidemic (with R_0>1) having infection rate matrix lambda
%assuming all infectives have mean infectious period 1.  vecpi contains the
%fractions of the population of the different types.  The program first
%calculates the extinction probability vector of the associated backward
%branching process, the elements of which are 1 minus the final fraction
%infected.
s=size(lambda);
k=s(1);
x=zeros(k,1);
for i=1:50
    x=backpgf(x,vecpi,lambda);
end 
%options = optimoptions('fsolve','Display','off');
pext=fsolve(@backpgfroot, x,[],vecpi,lambda);
for i=1:k
    tau(i)=1-pext(1,i);
end


