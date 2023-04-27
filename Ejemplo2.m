clear all; clc;
syms x y
%F = x * exp(-x^2-y^2);
F = 10-(exp(-1*(x^2+3*y^2)));
Lambda = 0.1;
X = [.6,.6];
Vf = inline([diff(F,x); diff(F,y)]);
for i = 1:100
    X = X-Lambda*Vf(X(1), X(2));
    A(i,1) = X(1);
    A(i,2) = X(2);
   % A(i,3) = X(1) * exp(-X(1)^2-X(2)^2);
    A(i,3) = 10-(exp(-1*(X(1)^2+3*X(2).^2)));
        x = linspace(-2,2,20);
        y = x';
        %z = x.*exp(-x.^2-y.^2);
        z = 10-(exp(-1*(x.^2+3*y.^2)));
        figure(1);
        surf(x,y,z); hold on;
        plot3(X(1),X(2),A(i,3), 'o', 'Color','r', 'MarkerFaceColor','r','MarkerSize',5); %x,y,z, símbolo, 
        pause(.1);
end