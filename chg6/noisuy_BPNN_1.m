% f = ax+b
function yc = noisuy_BPNN_1(xx,yy,xc)
    N = length(xx);
    X = sum(xx);
    Y = sum(yy);
    XX = sum(xx.*xx);
    XY = sum(xx.*yy);
    syms a b x;
    [a,b]=solve(XX*a + X*b == XY, X*a + N*b == Y);
    R = a*x+b;
    yc = double(subs(R,x,xc));
%     disp(a);
%     disp(b);
    
    hold on;
    fplot(R, [xx(1) xx(end)]);
    plot(xx,yy,'bo');
    plot(xc,yc, 'g*', 'Linewidth', 1);
end