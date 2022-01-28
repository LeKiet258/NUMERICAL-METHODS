% xc: 1 mang
function bang = noisuy_Newton(xx,yy,xc)
    N = yy(1);
    nCu = yy;
    syms x;
    x_out = xc.'; %chuyen ma tran hang thanh ma tran cot
    y_out = [];
    for i=2:length(xx)
        % tim ni(j) 
        n = [];
        for j=1:(length(xx)- i + 1)
            tmp = (nCu(j+1) - nCu(j))/(xx(i+j-1) - xx(j));
            n = [n, tmp];
        end
        % cap nhat N
        tich = n(1);
        for j=1:i-1
            tich = tich * (x-xx(j));
        end
        N = N + tich;
        % cap nhat nCu
        nCu = n;
    end
    % xap xi yc
    yc=double(subs(N,x,xc));
    y_out=yc.';
    bang = table(x_out,y_out);
    
    hold on;
    fplot(N, [xx(1),xx(end)]);
    plot(xx,yy,'bo');
    plot(xc, subs(N,x,xc), 'g*')
end