function ej6 = ej6()
    t = 0:.5:60; L = 5;
    y0 = [ L 0 L L 2*L 0 2*L L 3*L 0 zeros(1,10) ];


    [tout, yout] = ode23(@sistema,[0 1],y0)
    x = [];
    y = [];

    length(yout)
    for i = 1:length(yout)
        if !mod(i,2) == 0
            x(round(i/2)) = yout(i);
        else
            y(i/2) = yout(i);
        endif
    endfor

    length(x)
    length(y)

    h = plot(x,y);
    wait(h);
end 