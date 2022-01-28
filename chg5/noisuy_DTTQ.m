% xc: 1 mang
% xx, yy: mang 1D
function bang = noisuy_DTTQ(xx, yy, xc)
    X = []; Y = [];
    syms x;
    P=0;
    x_out = xc.'; %chuyen ma tran hang thanh ma tran cot
    y_out = [];
    
    % init X,Y
    for i=1:length(xx)
       row = [1];
       for j=1:length(xx) - 1
          row = [row, xx(i)^j]; 
       end
       X = [X; row];
       Y = [Y; yy(i)];
    end 
    
    %tim A
    A = inv(X) * Y;
    % tim da thuc noi suy P
    for i=1:length(A)
        P = P + A(i)*x^(i-1);
    end
    % xap xi gtri yc
    yc = double(subs(P,x,xc));
    y_out = yc.';
    bang = table(x_out,y_out)
    
    hold on;
    fplot(P, [xx(1) xx(end)]);
    plot(xx,yy,'bo');
    plot(xc, subs(P,x,xc), 'g*')
end