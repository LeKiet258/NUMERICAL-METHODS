% f = a*e^(bx)
function yc = noisuy_BPNN_2(xx,yy,xc)
    N = length(xx);
    X = sum(xx);
    lY = sum(log(yy));
    XX = sum(xx.*xx);
    XlY= sum(xx.*log(yy));
    syms A B x;
    
    [A,B]=solve(XX*A + X*B == XlY, X*A + N*B == lY);
    R=exp(B)*exp(A*x);
    yc = double(subs(R,x,xc));
%     disp(A);
%     disp(B);
    
    hold on;
    fplot(R, [xx(1) xx(end)]);
    plot(xx,yy,'bo');
end