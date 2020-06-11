function dydt=multiseirdydtB(t,y,lambda,gamma,sigma,k,tlockdown1, alphalockdown1, tlockdown2, alphalockdown2)
%This function is the equivalent of multiseirdydt.m to include lockdown.
%tlockdown1 and tlockdown2 are the start and end of lockdown. lambda
%gives the infection rates before lockdown.  During lockdown, all infection
%rates are multiplied by alphalockdown1 and after lockdown they are
%multiplied by alphalockdown2.

X=y(1:k);
L=y(k+1:2*k);
Y=y(2*k+1:3*k);
if t < tlockdown1
    lambdaa=lambda;
elseif t < tlockdown2
    lambdaa=alphalockdown1*lambda;
else
    lambdaa=alphalockdown2*lambda;
end
for i=1:k
    x=0;
    for j=1:k
        x=x+lambdaa(j,i)*Y(j);
    end
    dX(i)=-x*X(i);
    dL(i)=x*X(i)-sigma*L(i);
    dY(i)=sigma*L(i)-gamma*Y(i);
end
dydt=[dX dL dY]';
   