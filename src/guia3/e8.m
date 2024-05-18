function res = e8()
    
    figure
    [x y]=meshgrid(-2:0.3:2);
    [dx,dy] = f1(1,0,0,1,1,x,y);
    h = quiver(-x,y,dx,dy,'r');
    axis tight
    title('inciso a, caso i');

    figure
    [x y]=meshgrid(-4:0.3:4);
    [dx,dy] = f1(0,1,0,1,1,x,y);
    h = quiver(-x,y,dx,dy,'r');
    axis tight
    title('inciso a, caso ii');

    figure
    [x y]=meshgrid(-2:0.3:2);
    [dx,dy] = f1(0,0,1,1,1,x,y);
    h = quiver(-x,y,dx,dy,'r');
    axis tight
    title('inciso a, caso iii');

    figure
    [x y]=meshgrid(-2:0.3:2);
    [dx,dy] = f2(0,0,0,1,1,1,x,y);
    h = quiver(-x,y,dx,dy,'g');
    axis tight
    title('inciso b, caso i');

    figure
    [x y]=meshgrid(-2:0.3:2);
    [dx,dy] = f2(1,0,0,1,1,1,x,y);
    h = quiver(-x,y,dx,dy,'g');
    axis tight
    title('inciso b, caso ii');

    figure
    [x y]=meshgrid(-2:0.3:2);
    [dx,dy] = f2(0,1,0,0,1,1,x,y);
    h = quiver(-x,y,dx,dy,'g');
    axis tight
    title('inciso b, caso iii');
    
    res = 1;
end

function [dx,dy] = f1(a,b,c,n_x,n_y,x,y)
    nor = sqrt(n_x^2+n_y^2);
    
    n_x = n_x/nor;
    n_y = n_y/nor;

    alpha = (2*c - b - 2.*x.*y)*n_x;
    beta = (2*a - b -2.*x.*y )*n_y;
    
    dx = beta.*ones(size(x));
    dy = alpha.*ones(size(y));
end

function [dx,dy] = f2(a,b,c,d,n_x,n_y,x,y)
    nor = sqrt(n_x^2+n_y^2);
    
    n_x = n_x/nor;
    n_y = n_y/nor;

    alpha = n_x.*(6*a.*x + 2*b.*y + 2*b.*x + 2*c.*y - 2*x.*y);
    beta  = n_y.*(2*b.*x + 2*c.*y - 2*x.*y + 6*d.*y + 2*c.*x);

    dx = beta.*ones(size(x));
    dy = alpha.*ones(size(y));
end