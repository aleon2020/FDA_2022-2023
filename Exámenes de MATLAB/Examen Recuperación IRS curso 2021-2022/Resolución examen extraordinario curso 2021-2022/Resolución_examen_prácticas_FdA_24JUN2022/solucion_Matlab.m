%% 
% 

%Solicion a
t=0:0.1:10;
y=(891*exp(-30*t))/754 - (7*exp(-4*t))/78 - (8*exp(-t))/87;
plot(t,y);
%% 
% 

%solicion b
clear t;
t=sym('t');
y=(891*exp(-30*t))/754 - (7*exp(-4*t))/78 - (8*exp(-t))/87;
G=laplace(y);
collect(G)

[num,den]=numden(G);
num=sym2poly(num);
den=sym2poly(den);
Gpoly=tf(num,den)
Gzpk=zpk(Gpoly)
%% 
% 

%solucionc
rlocus(Gpoly)
[kcritico,poles]=rlocfind(Gpoly,0)
%% 
% 

%solución ejercicio 3
G=zpk([ ],[-0.5 -0.3],10)
sigma=4/10;
theta=4/5;
polos=([sigma+theta*1i sigma-theta*1i])
fas=pi-angle(evalfr(G,polos(1)))-angle(polos(1))
fas=fas-pi
fas*180/pi
b=real(polos(1))-(imag(polos(1)))/(tan(fas))
reg=zpk([b],[],1)
KR=1/abs(evalfr(reg*G,polos(1)))
R2=zpk([b],[],KR)
rlocus(R2*G)
step(feedback(R2*G,1))
%% 
% 
% 
%