function de=mpskDemod(z,M)

de=zeros(size(z));
p=phase(z);
p=mod(p, 2*pi);

if M==2
    de(z<0)=1;
else
    de=p-pi/M;
    de=de/(2*pi/M);
    de=round(de);    
end