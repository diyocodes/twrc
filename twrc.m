
%% BPSK Theory
SNR1=0:.5:16;
Perr=zeros(size(SNR1));
for SNRi=1:length(SNR1)
    Perr(SNRi)=qfunc(sqrt(1*10^(SNR1(SNRi)/10)));
end

%% Simple Two Way Relay Channel BPSK
%Parameter setting & initialization
M=2;
Ns=10000;
Niter=1;
h=1;
SNR2=0:2:16;
PerrA=zeros(size(SNR2));
PerrB=zeros(size(SNR2));
PerrRatio=zeros(size(SNR2));

for SNRi=1:length(SNR2)
    %Niter=Niter+Niter;    
    errA=0;
    errB=0;
    
    for iter=1:Niter
        %% Source
        %Source A
        dA=randi([0,M-1], Ns,1);
        sA=exp(dA.*1i*2*pi/M);
        %Source B
        dB=randi([0,M-1], Ns,1);       
        sB=exp(dB.*1i*2*pi/M);

        %% MAC Phase
        xAB=sA+h.*sB; 
        xAB=addnoise(xAB, SNR2(SNRi));

        %% Relay Processing       
        %HNC-map
        v=hncMap(xAB,M);
        v=exp(v.*1i*2*pi/M);

        %% BC Phase
        z=v;
        z=addnoise(z, SNR2(SNRi));

        %% Destination
        %Destinaiton A
        de=zeros(size(z));
        de(z<0)=1;
        deA=xor(de,dB);
        %Destination B
        ve=zeros(size(v));
        ve(v<0)=1;
        deB=xor(ve,dA);
        
        %Error counting
        errA=errA+numel(find(deA~=dA));
        errB=errB+numel(find(deB~=dB));        
        
    end
    %Error rate
    PerrA(SNRi)=errA/(Ns*Niter);
    PerrB(SNRi)=errB/(Ns*Niter);
    
    PerrRatio(SNRi)=PerrB(SNRi)/Perr(SNR1==SNR2(SNRi));
    fprintf('SNR = %.1fdB\n',SNR2(SNRi));
end

%% Plot
semilogy(SNR1,Perr);hold on;
semilogy(SNR2, PerrA,'-*');
semilogy(SNR2, PerrB, '-.bo');
hold off;grid;
xlabel('SNR [dB]');
ylabel('BER');
legend('BPSK', 'PNC','PNC noBC-noise','Location','Best');
