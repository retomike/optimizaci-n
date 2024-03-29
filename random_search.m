%Random Search Algorithm
%Miguel Luis
clear all; clc;
%Definition of objective function
funstr = '3*(1-x).^2.*exp(-(x.^2)-(y+1).^2)-10*(x/5-x.^3-y.^5).*exp(-x.^2-y.^2)-3*exp(-(x+1).^2-y.^2)'; %Los puntos
f = vectorize(inline(funstr));
range=[-3 3 -3 3]; %El primer rango es para x: -3 a 3. Lo segundo para y: -3 a 3, search space
%Draw the objective function
Ndiv=50;
dx=(range(2)-range(1))/Ndiv; 
dy=(range(4)-range(3))/Ndiv;
[x,y] = meshgrid(range(1):dx:range(2), range(3):dy:range(4)); %Meshgrid, líneas dentro de la figura
z = f(x,y);
figure(1);
surfc(x,y,z);
NITER = 300; k=0;
%Initialization of the candidate solution
xrange = range(2) - range(1);
yrange = range(4) - range(3);
xn = rand * xrange + range(1);
yn = rand * yrange + range(3);
%x^k+1 = x^k+triangulo x
%Starting point of the optimization process
while (k<NITER)
    %It is tested if the solution falls inside the search space
    if((xn>=range(1)) && (xn<=range(2)) && (yn>=range(3)) && (yn<=range(4))) % If yes, it is evaluated
        zn1=f(xn,yn);
    else
    % if not, it is assigned a low quality
        zn1= -100;
    end 
    %The produced soluction is draw
    figure(2);
    contour(x,y,z,15); hold on; %Imagen plasmada en el suelo y hold on deja la imagen anterior
    plot(xn, yn, '.', 'markersize',10, 'markerfacecolor', 'g');
    drawnow;hold on;
    %A new solution is produced
    xnc = xn + randn*1;
    ync = yn + randn*1;
    if((xnc >= range(1)) && (xnc<=range(2)) && (ync>=range(3)) && (ync<=range(4)))
        %if yes, it is evaluated
        zn2=f(xnc,ync);
    else
        %If not, it is assigned a low quality
        zn2 = -1000;
    end
    % It is analyzed if the new solution is accepted
    if (zn2 > zn1)
        xn = xnc;
        yn = ync;
    end
    k = k+1;
end 

%% LOS OPERADORES EN MATLAB QUE CONTIENE UN PUNTO
%Siempre actuan elemento por elemento, el caracter punto tambien permite
%Acceder a los campos d una estructura, además de las prioridades y los
%metodos de un objeto A.*B    A.^2  SI A es una escalar