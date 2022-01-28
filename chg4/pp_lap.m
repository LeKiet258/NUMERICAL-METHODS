 % A: ma tran vuong, C: ma tran dong
 function pp_lap(A, C, aEr)
    B= -A./diag(A) + eye(length(A));
    G= C./diag(A);
    X0=G; k=1;
    fX=aEr+1; % init
    
    Xn_out = [];
    fX_out = [];
    cond_out = [];
    rEx_out = [];
    
    while fX>=aEr && k<=100
        bool = 0;
        Xn= B*X0 + G;
        rEx= norm((Xn-X0)./X0);
        fX= norm(A*Xn - C);
        
        Xn_out = [Xn_out; Xn.']; %Xn.' : can chuyen Xn tu ma tran 1-cot sang ma tran 1-dong
        fX_out = [fX_out; fX];
        rEx_out = [rEx_out; rEx];
        
        if fX<aEr || k>100
            bool=1;
        end
        cond_out = [cond_out; bool];
        
        X0=Xn;
        k=k+1;
    end
    
    cond_out = logical(cond_out);
    t = table(Xn_out, fX_out, cond_out, rEx_out);    
    t
end