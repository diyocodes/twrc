%%
M=4;
Ns=100;
dA=randi([0,M-1], Ns,1);
sA=exp(1i*2*pi*(dA-1)/M);
dB=randi([0,M-1], Ns,1);
sB=exp(1i*2*pi*(dB-1)/M);

scatterplot(sA);
%%

de=floor(angle(sA)/(pi/M));