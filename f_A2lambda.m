function lbd = f_A2lambda(A,alpha,w0,Emax)
% the atmosphere water balance
    
    gma=w0./alpha;
    lx=0.05:0.01:0.95;
    eta=Emax./w0;
    pi2=lx./eta;
    pp=lx.*alpha;
    aa=pp-Emax*f_mean(gma,pi2);
    lbd=interp1(aa,lx,A);

end


