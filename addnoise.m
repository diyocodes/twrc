function [r, sigma]=addnoise(x, SNR)

sigma = sqrt(1*10.0^(-SNR/10.0));
r=x+sigma.*randn(size(x));

% if isreal(x)
%     r=x+sigma.*randn(size(x));
% else
%     r=(real(x)+sigma.*randn(size(x))) +1i*(imag(x)+sigma.*randn(size(x)));
% end;

end

