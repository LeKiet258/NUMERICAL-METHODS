function pp_daycung(f,a,b,aEf)
    syms x;
    k=1; 
    a_out=[a]; b_out=[b]; c_out=[]; fc_out=[]; cond_out=[]; rEc_out=[];
    
    %init
    if double(subs(f,x,a))*double(subs(f,x,b)) < 0
        while 1
           fa=double(subs(f,x,a)); 
           fb=double(subs(f,x,b));
           c=a-fa*(b-a)/(fb-fa);
           rEc=abs((c-a)/a);
           fc=double(subs(f,x,c));

           c_out=[c_out; c];
           fc_out=[fc_out; fc];
           rEc_out=[rEc_out; rEc];

           if abs(fc) < aEf
               cond_out=[cond_out; 1];
               break;
           end
           cond_out=[cond_out; 0];

           if fa*fc>0
               a=c;
           elseif fa*fc<0
               b=c;
           end
           a_out=[a_out; a];
           b_out=[b_out; b];

           k=k+1;
        end
        cond_out=logical(cond_out);
        t=table(a_out,b_out,c_out,fc_out,cond_out,rEc_out);
        t
    else
        disp('f(a).f(b) >= 0. Chon lai a,b');
    end
end