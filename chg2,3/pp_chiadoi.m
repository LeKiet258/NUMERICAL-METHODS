function pp_chiadoi(f,a,b,aEf)
    syms x;
    a_out=[1]; b_out=[1.4]; c_out=[]; fc_out=[]; cond_out=[]; rEc_out=[];
    k=1;
    
    % init
    
    if double(subs(f,x,a))*double(subs(f,x,b)) < 0
        while 1
           c=(a+b)/2;
           fa=double(subs(f,x,a));
           fc=double(subs(f,x,c));
           rEc=abs((a-c)/c);
           
           c_out=[c_out; c];
           fc_out=[fc_out; fc];
           rEc_out=[rEc_out; rEc];
           
           if abs(fc) < aEf
              cond_out=[cond_out; 1];
              break; 
           end
           cond_out=[cond_out; 0];
           
           dau=sign(fa*fc);
           if dau>0
               a=c;
           else
               b=c;
           end
           a_out=[a_out; a];
           b_out=[b_out; b];
           
           k=k+1;
        end
        
        t=table(a_out,b_out,c_out,fc_out,cond_out,rEc_out);
        t
    else
        disp('f(a).f(b) >= 0. Chon lai a,b');
    end
end