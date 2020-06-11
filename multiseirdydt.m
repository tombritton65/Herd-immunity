function dydt=multiseirdydt(t,y,lambda,gamma,sigma,k)
%This function gives the right-hand sides of the system of ODEs
%for a deterministic multitype SEIR model with k types, all having
%mean infectious period 1/gamma and mean exposed (latent) period 1/sigma.
%lambda is the infection rate matrix.  y is a vector of
%dimension 3*k.  The first k entries give the fraction of the
%population infected of the different types, the next k the fraction
%exposed and the last k the fraction infected.
X=y(1:k);
L=y(k+1:2*k);
Y=y(2*k+1:3*k);
for i=1:k
    x=0;
    for j=1:k
        x=x+lambda(j,i)*Y(j);
    end
    dX(i)=-x*X(i);
    dL(i)=x*X(i)-sigma*L(i);
    dY(i)=sigma*L(i)-gamma*Y(i);
end
dydt=[dX dL dY]';
   