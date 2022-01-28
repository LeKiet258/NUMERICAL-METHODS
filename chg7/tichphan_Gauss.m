% cho truoc ham f(x)
function tichphan_Gauss(f,a,b)
    syms x;
    % gauss 2
    x_i2= [-0.577; 0.577];
    w_i2= [1; 1];
    t_i2= (b-a)/2*x_i2 + (a+b)/2; 
    gauss_2= (b-a)/2*sum(w_i2.*double(subs(f,x,t_i2)));  
    
    % gauss 3
    x_i3= [-0.775; 0; 0.775];
    w_i3= [0.556; 0.889; 0.556];
    t_i3= (b-a)/2*x_i3 + (a+b)/2;
    gauss_3= (b-a)/2*sum(w_i3.*double(subs(f,x,t_i3)));
    
end