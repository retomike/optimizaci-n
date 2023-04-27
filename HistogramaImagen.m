%HISTOGRAMA DE IMAGENES
%Miguel Angel Luis Espinoza
clearvars;

%Escala de Grises % x1+x2+x3/3
I=imread('lena.jpg');
[M, N]=size(I); % dimensiones de la imagen
for i=1:M
for j=1:N/3
%R '= G' = B ' = 0.2126 R + 0.7152 G + 0.0722 B
x=(I(i,j)*0.299+I(i,j)*0.587+I(i,j)*0.114);
I(i,j,1)=x; I(i,j,2)=x; I(i,j,3)=x;
end
end

%figure(1)
%imshow(I)

pixmax = 256;
Tam=zeros(pixmax);

%Ecualización
for rxp=1:M
for ryp=1:N
    rxyp = I(rxp,ryp);
    for val = 1:pixmax
        if rxyp == val
            Tam(val) = Tam(val)+1;
        end
    end
end
end

figure(2);
stem(Tam);


%HISTOGRAMA ACUMULATIVO 
H=[1:256];
Vo = 0;

for ru=1:255
    H(ru)=Vo+Tam(ru);
    Vo=H(ru);
end
figure(1)
stem(H);

%Histograma Ecualizado(Lineal)
Inh = [1:256];
for rxs=1:M
    for rys=1:N
        ac = I(rxs, rys);
            if ac == 256
            Inh(rxs, rys)= Tam(ac+1)*(255/M*N);
            end
        
    end
end

figure(3);
stem(Inh);

figure(4);

subplot(2,2,1),stem(Tam), title('Ecualización');
subplot(2,2,2),stem(H), title('Acumulado');
subplot(2,2,3),stem(Inh), title('Lineal');

