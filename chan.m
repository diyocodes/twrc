function y=chan(x, delay, ntap)
      
Lch=delay+1; % channel length
h=zeros(1,max(Lch));
h(Lch)=rand(1,ntap)+1i*rand(1,ntap);
y=conv(x,h);




    