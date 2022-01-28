function pp_lap(f,phi,x0,aEf)
    syms x;
    xn_out=[]; fx_out=[]; cond_out=[]; rExn_out = [];
    k=1;
    hold on;
    
    % init
    xn_out = [xn_out; x0];
    fx_out=[fx_out; subs(f,x,x0)];
    cond_out=[cond_out; 0];
    rExn_out=[rExn_out; 0];
    
    while 1
       xn = subs(phi,x,x0);
       rExn = abs((xn-x0)/x0);
       fx=subs(f,x,xn);
%        plot(k,fx,'ro');
       
       xn_out = [xn_out; xn]; 
       rExn_out = [rExn_out; rExn];
       fx_out = [fx_out; fx];
       
       if abs(fx) < aEf
         cond_out=[cond_out; 1];
         break;  
       end
       cond_out=[cond_out; 0];
       
       x0=xn;
       k=k+1;
    end
    
    % output
    xn_out = double(xn_out);
    fx_out = double(fx_out);
    rExn_out = double(rExn_out);
    cond_out = logical(cond_out);
    
    t=table(xn_out,fx_out,cond_out,rExn_out);
    t
end