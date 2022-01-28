% h: moc cach deu
function daoham_3D(xx,yy,x0,df,h)
    pos = find(xx==x0);
    df_3DC= 1/(2*h)*(-3*yy(pos)+4*yy(pos+h)-yy(pos+2*h));
    rEdf_3DC= abs((df-df_3DC)/df);
    
    df_3DG= 1/(2*h)*(-yy(pos-h) + yy(pos+h));
    rEdf_3DG= abs((df-df_3DG)/df);
end