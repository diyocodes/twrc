%% test without relay
M=4;
Ns=10;
dA=randi([0,M-1], Ns,1);
%dA=0:M-1;
sA=mpskMod(dA, M);
dB=randi([0,M-1], Ns,1);
%dB=0:M-1;
sB=mpskMod(dB, M);
%xAB = sA+sB;

%%
%sA=addnoise(sA, 10, 'complex');
%scatterplot(xAB);
de=mpskDemod(sA,M);