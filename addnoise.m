function [r, sigma]=addnoise(x, SNR, varargin)
%[r, sigma]=addnoise(x, SNR, 'complex')

sigma = sqrt(1*10.0^(-SNR/10.0));

if nargin==2
    %Add real noise
    r=x+sigma.*randn(size(x));
else
    %Add complex noise
    r=(real(x)+sigma.*randn(size(x))) +1i*(imag(x)+sigma.*randn(size(x)));
end;

end

