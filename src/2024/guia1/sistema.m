function [t,x] = sistema(t,y)
    
    # Longitud del desplazamiento por barras
    L = 5;

    #Peso
    W = [0;-5];

    # Masas
    for i = 1:7
        m(i) = 0.5;
    endfor

    # Coordenadas Iniciales
    x0{1} = [  0,  0];
    x0{2} = [  0,  L];
    x0{3} = [  L,  0];
    x0{4} = [  L,  L];
    x0{5} = [  0,2*L];
    x0{6} = [2*L,  L];
    x0{7} = [3*L,  0];

    # Constantes Resortes
    K = 20;

    k13 = K;
    k23 = K;
    k24 = K;
    k34 = K;
    k35 = K;
    k45 = K;
    k46 = K;
    k56 = K;
    k57 = K;
    k67 = K;
    

    # Longitudes Originales
    L0_13 = norm(x0{1} - x0{3});
    L0_23 = norm(x0{2} - x0{3});
    L0_24 = norm(x0{2} - x0{4});
    L0_34 = norm(x0{3} - x0{4});
    L0_35 = norm(x0{3} - x0{5});
    L0_45 = norm(x0{4} - x0{5});
    L0_46 = norm(x0{4} - x0{6});
    L0_56 = norm(x0{5} - x0{6});
    L0_57 = norm(x0{5} - x0{7});
    L0_67 = norm(x0{6} - x0{7});

    # Coordenadas de las particulas
    X{1} = x0{1};
    X{2} = x0{2};
    X{3} = x0{3}+y(1);
    X{4} = x0{4}+y(2);
    X{5} = x0{5}+y(3);
    X{6} = x0{6}+y(4);
    X{7} = x0{7}+y(5);

    # Fuerzas de los resortes
    F_13 = k13*(L-L0_13); 
    F_23 = k23*(L-L0_23);
    F_24 = k24*(L-L0_24);
    F_34 = k34*(L-L0_34);
    F_35 = k35*(L-L0_35);
    F_45 = k45*(L-L0_45);
    F_46 = k46*(L-L0_46);
    F_56 = k56*(L-L0_56);
    F_57 = k57*(L-L0_57);
    F_67 = k67*(L-L0_67);

    # Longitudes

    L_13 = norm(X{1}-X{3});
    L_23 = norm(X{2}-X{3});
    L_24 = norm(X{2}-X{4});
    L_34 = norm(X{3}-X{4});
    L_35 = norm(X{3}-X{5});
    L_45 = norm(X{4}-X{5});
    L_46 = norm(X{4}-X{6});
    L_56 = norm(X{5}-X{6});
    L_57 = norm(X{5}-X{7});
    L_67 = norm(X{6}-X{7});

    # Velocidades
    v{1} = 0;
    v{2} = 0;
    v{3} = y(11:12);
    v{4} = y(13:14);
    v{5} = y(15:16);
    v{6} = y(17:18);
    v{7} = y(19:20);

    f = [
        v{3}
        v{4}
        v{5}
        v{6}
        v{7}
        (-F_13-F_23+F_34)/m(3)
        (-F_24-F_34+F_45)/m(4)
        (-F_35-F_45+F_56)/m(5)
        (-F_46-F_56+F_67)/m(6)
        (-F_57-F_67+W)/m(7)
    ];

end 