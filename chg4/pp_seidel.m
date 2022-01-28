function [nghiem, bang] = pp_seidel(A, C, aEr)
    B= -A./diag(A) + eye(length(A));
    G= C./diag(A);
    X0=G; k=1; Xn=X0;
    fX = aEr+1;
    N = length(A); % N dong ung voi N PT trong HPT
    Xn_out = []; fX_out = []; cond_out = []; rEXn_out = [];

    while abs(fX) >= aEr && k<=100
        for i = 1:N
            Xn(i) = 0;
            for j = 1:N
                if j < i, Xn(i) = Xn(i) + B(i,j)*X0(j);
                else Xn(i) = Xn(i) + B(i,j)*Xn(j); end
            end
            Xn(i) = Xn(i) + G(i);
        end
        rEx = norm((Xn-X0)./X0);
        fX = norm(A*Xn-C);
        
        %--------cap nhat output------
        Xn_out = [Xn_out; Xn.']; %Xn.' : can chuyen Xn tu ma tran 1-cot sang ma tran 1-dong
        fX_out = [fX_out; fX];
        rEXn_out = [rEXn_out; rEx];
        bool=0;
        if abs(fX) < aEr || k>100
            bool=1;
        end
        cond_out = [cond_out; bool];
        %------------------
        
        % updated
        X0=Xn;
        k=k+1;
    end
    
    cond_out = logical(cond_out);
    bang = table(Xn_out, fX_out, cond_out, rEXn_out);
    bang % in ra
    nghiem=Xn;
end