function dydt=multiseirdydtC(t,y,lambda,gamma,sigma,k,tlockdown1, alphalockdown1, tlockdown2, tlockdown3)
%This function is the equivalent of multiseirdydt.m to include lockdown
%followed by gradual relaxation of lockdown.  lambda gives the infection 
%rates before lockdown.  Lockdown starts at time tlockdown1, when all
%infection rates are multiplied by alphalockdown1, and is released 
%gradually (i.e. linearly) between times tlockdown2 and tlockdown3, so that
%at time tlockdown3 all infection rates are back at their pre-lockdown
%values.

X=y(1:k);
L=y(k+1:2*k);
Y=y(2*k+1:3*k);
if t < tlockdown1
    lambdaa=lambda;
elseif t < tlockdown2
    lambdaa=alphalockdown1*lambda;
elseif t < tlockdown3
    alp=alphalockdown1+(t-tlockdown2)/(tlockdown3-tlockdown2)*(1-alphalockdown1);
    lambdaa=alp*lambda;
else
    lambdaa=lambda;
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
   