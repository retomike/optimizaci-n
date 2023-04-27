%ESCALA DE GRISES
%Miguel Angel Luis Espinoza
clearvars;
A=imread('lena.jpg'); % leer imagen
[M, N]=size(A); % dimensiones de la imagen
figure(1) % imprime la foto en figura 1
imshow(A);
%Escala de Grises % x1+x2+x3/3
I=imread('lena.jpg');
for i=1:M
for j=1:N/3
%R '= G' = B ' = 0.2126 R + 0.7152 G + 0.0722 B
x=(I(i,j)*0.299+I(i,j)*0.587+I(i,j)*0.114);
I(i,j,1)=x; I(i,j,2)=x; I(i,j,3)=x;
end
end

figure(2)
imshow(I)

figure(3) % imprime la foto en figura 1
pesos=[0.2989 0.5870 0.1140];
Apesos=A(:,:,1)*pesos(1)+A(:,:,2)*pesos(2)+A(:,:,3)*pesos(3);
imshow(Apesos);


%BINARIZACIÓN
for i=1:M
for j=1:N
if I(i,j)<=128
   I(i,j)=0;
else
   I(i,j)=255;
end
end
end
figure(4);
imshow(I);

%BINARIZACIÓN INVERSA
for i=1:M
for j=1:N
if I(i,j)<=128
   I(i,j)=255;
else
   I(i,j)=0;
end
end
end
figure(5);
imshow(I);

% ESCALA DE GRISES SUMATORIA
I=imread('lena.jpg');
for i=1:M
for j=1:N/3
Im_R=I(i,j,1);
Im_G=I(i,j,2);
Im_B=I(i,j,3);
x=(Im_R/3+Im_G/3+Im_B/3);
I(i,j,1)=x; I(i,j,2)=x; I(i,j,3)=x;
end
end

figure(6)
imshow(I)




