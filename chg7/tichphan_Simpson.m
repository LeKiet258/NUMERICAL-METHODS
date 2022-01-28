% simpson 1/3: chia thanh 2 khoang chia bang nhau: [x1 x2 x3]
% simpson 3/8: chia thanh 3 khoang chia bang nhau: [x1 x2 x3 x4]
% ham chi tinh cho 1 bo bat ky trong xx, de tinh cha tat ca thi lam ham
% khac
function kq = tichphan_Simpson(xx,yy,x_dau,x_cuoi)
    i= find(xx==x_dau);
    kq_13= (x_cuoi-x_dau)/6 * (yy(i)+4*yy(i+1)+yy(i+2));
    kq_38= (x_cuoi-x_dau)/8 * (yy(i) + 3*yy(i+1) + 3*yy(i+2) + yy(i+3));
end