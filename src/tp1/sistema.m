function y = sistema(t,Y)

  ## Carga
  P = -1;

  ## Masas
  m = [1 1 1 1 3 2 1 1 1 1 1 2];


  ## Constantes de Resortes
  k12 = 6;
  k16 = 4;
  k17 = 6;
  k27 = 6;
  k34 = 6;
  k311 = 6;
  k411 = 6;
  k412 = 4;
  k58 = 4;
  k59 = 4;
  k510 = 4;
  k67 = 4;
  k78 = 2;
  k89 = 4;
  k910 = 4;
  k1011 = 2;
  k1112 = 4;


  ## Posiciones Originales
  x01  = [ 0; 0];
  x02  = [10; 0];
  x03  = [50; 0];
  x04  = [60; 0];
  x05  = [30;10];
  x06  = [ 0;20];
  x07  = [10;20];
  x08  = [20;20];
  x09  = [30;20];
  x010 = [40;20];
  x011 = [50;20];
  x012 = [60;20];


  ## Longitudes Originales
  L0_12 = norm(x02-x01);
  L0_16 = norm(x06-x01);
  L0_17 = norm(x07-x01);
  L0_27 = norm(x07-x02);
  L0_34 = norm(x04-x03);
  L0_311 = norm(x011-x03);
  L0_411 = norm(x011-x04);
  L0_412 = norm(x012-x04);
  L0_58 = norm(x08-x05);
  L0_59 = norm(x09-x05);
  L0_510 = norm(x010-x05);
  L0_67 = norm(x07-x06);
  L0_78 = norm(x08-x07);
  L0_89 = norm(x09-x08);
  L0_910 = norm(x010-x09);
  L0_1011 = norm(x011-x010);
  L0_1112 = norm(x012-x011);


  ## Posiciones Actuales
  x1 = x01; ## Fija
  x2 = [Y(1);0]; ## Solo se mueve en X
  x3 = [Y(2);0]; ## Solo se mueve en X
  x4 = x04; ## Fija
  x5 = Y(3:4);
  x6 = Y(5:6);
  x7 = Y(7:8);
  x8 = Y(9:10);
  x9 = Y(11:12);
  x10 = Y(13:14);
  x11 = Y(15:16);
  x12 = Y(17:18);


  ## Longitudes Actuales
  L_12 = norm(x2-x1);
  L_16 = norm(x6-x1);
  L_17 = norm(x7-x1);
  L_27 = norm(x7-x2);
  L_34 = norm(x4-x3);
  L_311 = norm(x11-x3);
  L_411 = norm(x11-x4);
  L_412 = norm(x12-x4);
  L_58 = norm(x8-x5);
  L_59 = norm(x9-x5);
  L_510 = norm(x10-x5);
  L_67 = norm(x7-x6);
  L_78 = norm(x8-x7);
  L_89 = norm(x9-x8);
  L_910 = norm(x10-x9);
  L_1011 = norm(x11-x10);
  L_1112 = norm(x12-x11);


  ## Fuerzas
  F12 = k12*(1-L0_12/L_12)*(x2-x1);
  F16 = k16*(1-L0_16/L_16)*(x6-x1);
  F17 = k17*(1-L0_17/L_17)*(x7-x1);
  F27 = k27*(1-L0_27/L_27)*(x7-x2);
  F34 = k34*(1-L0_12/L_12)*(x2-x1);
  F311 = k311*(1-L0_311/L_311)*(x11-x3);
  F411 = k411*(1-L0_411/L_411)*(x11-x4);
  F412 = k412*(1-L0_412/L_412)*(x12-x4);
  F58 = k58*(1-L0_58/L_58)*(x8-x5);
  F59 = k59*(1-L0_59/L_59)*(x9-x5);
  F510 = k510*(1-L0_510/L_510)*(x10-x5);
  F67 = k67*(1-L0_67/L_67)*(x7-x6);
  F78 = k78*(1-L0_78/L_78)*(x8-x7);
  F89 = k89*(1-L0_89/L_89)*(x9-x8);
  F910 = k910*(1-L0_910/L_910)*(x10-x9);
  F1011 = k1011*(1-L0_1011/L_1011)*(x11-x10);
  F1112 = k1112*(1-L0_1112/L_1112)*(x12-x11);


  ## Declaramos el vector columna
  y = zeros(36,1);

  ## Velocidades
  y(1:18) = Y(19:36);


  ## Posiciones
  y(19) = (1/m(2)) * (F27(1)-F12(1)); ## Coordenada X particula 2
  y(20) = (1/m(3)) * (F34(1)+F311(1)); ## Coordenada X particula 3
  y(21) = (1/m(5)) * (F58(1)+F59(1)+F510(1)-P/2); ## Coordenada X particula 5
  y(22) = (1/m(5)) * (F58(2)+F59(2)+F510(2)+P); ## Coordenada Y particula 5
  y(23:24) = (1/m(6)) * (-F16+F67);
  y(25:26) = (1/m(7)) * (-F17-F27-F67+F78);
  y(27:28) = (1/m(8)) * (-F58-F78+F89);
  y(29:30) = (1/m(9)) * (-F59-F89+F910);
  y(31:32) = (1/m(10)) * (-F510-F910+F1011);
  y(33:34) = (1/m(11)) * (-F311-F411-F1011+F1112);
  y(35:36) = (1/m(12)) * (-F412-F1112);


end
