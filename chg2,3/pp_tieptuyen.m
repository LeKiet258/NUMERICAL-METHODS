function pp_tieptuyen(f,x0,aEf)
    syms x;
    df=diff(f,x);
    k=1; x0_out=[]; xn_out=[]; fxn_out=[]; cond_out=[]; rExn_out=[];
    
    %init
    
    while 1
       xn=double(x0-subs(f,x,x0)/subs(df,x,x0));
       rExn=abs((xn-x0)/x0);
       fxn=double(subs(f,x,xn));
       
       x0_out=[x0_out; x0];
       xn_out=[xn_out; xn];
       rExn_out=[rExn_out; rExn];
       fxn_out=[fxn_out; fxn];
       if abs(fxn) < aEf
           cond_out=[cond_out; 1];
           break;
       end
       cond_out=[cond_out; 0];
       
       x0=xn;
       k=k+1;
    end
    cond_out=logical(cond_out);
    t=table(x0_out,xn_out,fxn_out,cond_out,rExn_out);
    t
end