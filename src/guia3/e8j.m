function res = e8j()
    figure
    [x y]=meshgrid(-4:0.3:4,-4:0.3:4);
    n = length(x);
    dy=0.*[ones(size(y))]%fi1(1,0,0,x,y);
    dx=ones(size(dy));
    L=sqrt(1+dy.^2);
    quiver(-x,y,dx./L,dy./L,'r');
    axis tight
    title('inciso a, caso i');
    figure
    [x y]=meshgrid(-4:0.3:4,-4:0.3:4);
    dy=fi1(0,1,0,x,y);
    dx=ones(size(dy));
    L=sqrt(1+dy.^2);
    quiver(x,y,dx./L,dy./L,'r');
    axis tight
    title('inciso a, caso ii');
    figure
    [x y]=meshgrid(-4:0.3:4,-4:0.3:4);
    dy=fi1(0,0,1,x,y);
    dx=ones(size(dy));
    L=sqrt(1+dy.^2);

    quiver(x,y,dx./L,dy./L,'r');
    axis tight
    title('inciso a, caso iii');
    figure
    [x y]=meshgrid(-4:0.3:4,-4:0.3:4);
    dy=fi2(0,0,0,1,x,y);
    dx=ones(size(dy));
    L=sqrt(1+dy.^2);
    quiver(x,y,dx./L,dy./L,'g');
    axis tight
    title('inciso b, caso i');
    figure
    [x y]=meshgrid(-4:0.3:4,-4:0.3:4);
    dy=fi2(1,0,0,0,x,y);
    dx=ones(size(dy));
    L=sqrt(1+dy.^2);
    quiver(x,y,dx./L,dy./L,'g');
    axis tight
    title('inciso b, caso ii');
    figure
    [x y]=meshgrid(-4:0.3:4,-4:0.3:4);
    dy=fi2(0,1,0,0,x,y);
    dx=ones(size(dy));
    L=sqrt(1+dy.^2);
    quiver(x,y,dx./L,dy./L,'g');
    axis tight
    title('inciso b, caso iii');
end