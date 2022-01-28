% xc: phai la 1 so
function xapxi_Spline(xx,yy,xc)
    syms x;
    h = [xx;0] - [0;xx];
    h = h(2:(end-1));
    n = length(xx) - 1;
    A = zeros(n-1);
    b = zeros(n-1,1);
    yc=[];
    
    for i=1:n-1
        if i == 1
            A(i,i)= (h(i)+h(i+1))/3;
            A(i,i+1)= h(i+1)/6;
        elseif i == n-1
            A(i,i-1)= h(i)/6;
            A(i,i)= (h(i) + h(i+1))/3;
        else 
            A(i,i-1)=h(i)/6;
            A(i,i) = (h(i) + h(i+1))/3;
            A(i,i+1)=h(i+1)/6;
        end
        b(i) = (yy(i+2) - yy(i+1))/h(i+1) - (yy(i+1) - yy(i))/h(i);
    end
    m = [0, (A\b)', 0];
    S = x*ones(n,1);
    % xay dung ham f(x)=S bac n-1
    for i=1:n
       M = yy(i) - m(i)*h(i)^2/6;
       N = yy(i+1) - m(i+1)*h(i)^2/6;
       S(i) = m(i+1) * (x-xx(i))^3/(6*h(i)) + m(i)*(xx(i+1)-x)^3/(6*h(i)) + M*(xx(i+1)-x)/h(i) + N*(x-xx(i))/h(i);
    end
    % KT xc nam trong khoang nao
    for i=1:length(xc)
        k=1;
        while (k <= n)
            if(xc(i) >= xx(k) && xc(i) <= xx(k+1))
                break;
            end
            k=k+1;
        end
        yc = [yc; double(subs(S(k),x,xc(i)))];
    end
    
    hold on;
    for i=1:n % ve tung duong cong Si
       fplot(S(i), [xx(i) xx(i+1)], 'b', 'Linewidth', 1);  
    end
    plot(xx,yy,'mo-', 'Linewidth',0.5); % ve duong thang
    plot(xc,yc, 'g*', 'Linewidth', 1); 
end
