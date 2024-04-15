
## Condicones iniciales Y0 = [x0 v0]
Y0 =   [10 50 30 10 0 20 10 20 20 20 30 20 40 20 50 20 60 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ]';

# Resolvemos el sistema
[t, X] = ode23s(@sistema,[0 40],Y0);

out_dir = "temp_img";
mkdir (out_dir);

x = zeros(size(X,1),18);
y = zeros(size(X,1),18);

for i = 1:size(X,1)
    x(i,1) = 0;
    y(i,1) = 0;
    x(i,2) = X(i,1);
    y(i,2) = 0;
    x(i,3) = X(i,2);
    y(i,3) = 0;
    x(i,4) = 60;
    y(i,4) = 0;

    for j = 3 : 2 : 17
       
        x(i, round((j+4)/2)+1) = X(i,j);
    endfor

    for j = 4 : 2 : 18
        y(i,((j+4)/2)+1) = X(i,j);
    endfor

endfor

for i = 1:size(t,1)
    hold on
    xlim([-20 80])
    ylim([-20 40])
    xlabel('x')
    ylabel('y')
    title('Caso 10')
    

    plot([x(i,1) x(i,2)],[y(i,1) y(i,2)],'LineWidth',2,'Color','black');
    plot([x(i,1) x(i,7)],[y(i,1) y(i,7)],'LineWidth',2,'Color','black');
    plot([x(i,1) x(i,6)],[y(i,1) y(i,6)],'LineWidth',2,'Color','black');

    plot([x(i,7) x(i,2)],[y(i,7) y(i,2)],'LineWidth',2,'Color','black');
    plot([x(i,7) x(i,6)],[y(i,7) y(i,6)],'LineWidth',2,'Color','black');
    plot([x(i,7) x(i,8)],[y(i,7) y(i,8)],'LineWidth',2,'Color','black');

    plot([x(i,8) x(i,9)],[y(i,8) y(i,9)],'LineWidth',2,'Color','black');
    plot([x(i,8) x(i,5)],[y(i,8) y(i,5)],'LineWidth',2,'Color','black');

    plot([x(i,5) x(i,9)],[y(i,5) y(i,9)],'LineWidth',2,'Color','black');
    plot([x(i,5) x(i,10)],[y(i,5) y(i,10)],'LineWidth',2,'Color','black');

    plot([x(i,10) x(i,9)],[y(i,10) y(i,9)],'LineWidth',2,'Color','black');
    plot([x(i,10) x(i,11)],[y(i,10) y(i,11)],'LineWidth',2,'Color','black');

    plot([x(i,11) x(i,12)],[y(i,11) y(i,12)],'LineWidth',2,'Color','black');
    plot([x(i,11) x(i,4)],[y(i,11) y(i,4)],'LineWidth',2,'Color','black');
    plot([x(i,11) x(i,3)],[y(i,11) y(i,3)],'LineWidth',2,'Color','black');

    plot([x(i,3) x(i,4)],[y(i,3) y(i,4)],'LineWidth',2,'Color','black');
    
    plot([x(i,12) x(i,4)],[y(i,12) y(i,4)],'LineWidth',2,'Color','black');
    
    
    plot(x(i,:),y(i,:),'o','LineWidth',2);

    drawnow
    hold off
    grid on
    pause off
    fname = fullfile (out_dir, sprintf ("img%03i.png", i));
    imwrite (getframe (gcf).cdata, fname);
    clf
endfor

cmd = sprintf ("ffmpeg -framerate 60 -i ./%s/img%%03d.png -vf scale=1080:-1 TP1.mp4", out_dir)

system (cmd)


