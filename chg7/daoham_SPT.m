% dao ham tai x0 su dung SPT, cho biet truoc df(1) de tinh sai so
function daoham_SPT(xx,yy,df,h,x0)
    pos = find(xx==x0); % tim vi tri x0 trong mang
    df_SPT = (yy(pos+h)-yy(pos))/h;
    rEdf_SPT= abs((df-df_SPT)/df);
    
    df_SPL= (yy(pos)-yy(pos-h))/h;
    rEdf_SPL= abs((df-df_SPL)/df);
end