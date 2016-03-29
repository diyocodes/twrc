function s=mpskMod(d, M)

if M==2
    s=exp(1i*2*pi*d/M);
else
    s=exp(1i*2*pi*d/M+1i*pi/M);
end



