clearvars; clc;

%Get the image
imagen=imread('lena.jpg');
Im_R=imagen(:,:,1);
Im_G=imagen(:,:,2);
Im_B=imagen(:,:,3);
[m,n,p]=size(imagen);

%Obtener valor RGB de un pixel
imagen(300,300,1);
imagen(300,300,2);
imagen(300,300,3);

%pixel=impixel;
%pixel;

%%Cambiar color de un pixel
imagen(300,300,1)=255;
imagen(300,300,2)=255;
imagen(300,300,3)=255;

imshow(imagen);
%Muestra colores de una línea
improfile