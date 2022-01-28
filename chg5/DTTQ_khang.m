function [P,yc] = DTTQ_khang(xx,yy,xc,n)
    X = [];
    Y = [];
    for i = 1:n
        X_T = [];
        for j = 1:n
            X_T = [X_T, xx(i)^(j-1),];
        end
        X = [X; X_T];
        Y = [Y; yy(i)];
    end

    A = inv(X)*Y;

    syms x;
    P = 0;
    for i = 1:n
        P = P + A(i)*x^(i-1);
    end
    yc = double(subs(P,x,xc));
end