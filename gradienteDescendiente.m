%% Gradiente descendiente
% SCRIP  10X^2+5XY+10(Y-3)2
%
%----------------------------
clear all; clc;
syms x y;
f = 10*x^2+5*x*y+10*(y-3)^2;
alpha = 0.01; %LEARNING RATE
vf = inline([diff(f,x);diff(f,y)]);
X = [-8, 8];
   % fobj = inline(f);
   % fobj(x(1), x(2)); %-6
for i=1:100
    X = X - alpha*vf(X(1), X(2));
    A(i,1) = X(1);
    A(i,2) = X(2);
    A(i,3) = 10*X(1)^2+5*X(1)*X(2)+10*(X(2)-3)^2;
        x = linspace(-8,8,30);
        y = x';
        z = 10.*x.^2+5.*x.*y+10.*(y-3).^2;
        figure(2);
        surf(x,y,z); hold on;
        plot3(X(1),X(2),A(i,3), 'o', 'Color','r', 'MarkerFaceColor','r','MarkerSize',5); %x,y,z, símbolo, 
        pause(.8);
end