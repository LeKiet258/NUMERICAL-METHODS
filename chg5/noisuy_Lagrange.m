% x: ma tran 1D
function noisuy_Lagrange(xx,yy,xc)
    syms x;
    Li = [];
    n=length(xx);
    x_out = xc.'; y_out = [];
    
    % xay dung da thuc Li,n
    for i = 1:n
        tu = 1;
        mau = 1;
        for j = 1:n
            if j ~= i
                tu = tu * (x-xx(j));
                mau = mau * (xx(i)-xx(j));
            end
        end
        Li = [Li, tu/mau];
    end
    
    % xay dung da thuc NOI SUY Ln
    L = sum(Li.*yy);
    yc = double(subs(L,x,xc)); % xc la 1 mang, ko phai 1 so
    y_out = yc.';
    t = table(x_out,y_out)
    
    hold on;
    fplot(L, [xx(1) xx(end)]);
    plot(xx,yy,'bo');
    plot(xc, subs(L,x,xc), 'g*')
end