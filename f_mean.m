function f = f_mean(gma,pi2)
% pi2=lambda/eta
F1=gma.^(pi2-1).*exp(-gma)./(gamma(pi2)-incgma(pi2,gma));
f=pi2./gma-F1;
f(f<0.001)=0.001;
function y=incgma(a,b)
    y=(1-gammainc(b,a)).*gamma(a);
end

end
