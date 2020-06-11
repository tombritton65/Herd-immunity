function dydt=multiseirdydtA(t,y,lambda,gamma,sigma,k,tlockdown, alphalockdown)
%This function is the equivalent of multiseirdydt.m to include indefinite
%lockdown, which starts at time tlockdown when all infection
%rates are multiplied by alphalockdown.

X=y(1:k);
L=y(k+1:2*k);
Y=y(2*k+1:3*k);
if t < tlockdown
    lambdaa=lambda;
else
    lambdaa=alphalockdown*lambda;
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
   