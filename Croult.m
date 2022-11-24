% FACTORIZACION lU CROULT

clc  %permite borrar el area de trabajo
clear  %permite borrar las variables almacenadas
format long %permite utilizar la maxima capacidad de la maquina

fprintf('                     FACTORIZACION LU CROULT\n\n\n');
%fprintf me permite ingresar comentarios de manera textual que pueden
%orientar al usuario en el uso del programa

%input es un comando de solicitud de entrada de datos del usuario.
A=input('Ingrese la matriz A = \n');
b=input('\nIngrese el vector b, correspondite a los terminos independientes b=\n');

[n,m]=size(A);
C=[A,b];
% la matriz C, representa la forma de la matriz aumentada [Ab]

fprintf('\nLa Matriz C, que corresponte a la matriz aumentada [Ab] es = \n');
disp(C)
if n==m 
    for k=1:n
      %La instrucci�n iterativa for permite repetir estamentos a un
      %numero espec�fico de veces  
        u(k,k)=1; %princio del metodo
        suma=0;
        for p=1:k-1
            suma=suma+L(k,p)*u(p,k);
        end
        L(k,k)=(A(k,k)-suma); 
        
        for i=k+1:n
            suma=0;
            for r=1:k-1
                suma=suma+L(i,r)*u(r,k);
            end
            L(i,k)=(A(i,k)-suma); %obtencion de la matriz L
        end
        for j=k+1:n
            suma=0;
            for s=1:k-1
                suma=suma+L(k,s)*u(s,j);
            end
            u(k,j)=(A(k,j)-suma)/L(k,k); %obtencion de la matriz U
        end
    end
    memoriau=1; %calculo del determinante de u
    memoriaL=1; %calculo del determinante inicial de L
    for i=1:n
        memoriaL=memoriaL*L(i,i); 
    end
    producto=memoriaL*memoriau;  %calculo del determinante total
    
    if producto~=0
  
    
    for i=1:n
            suma=0;
            for p=1:i-1
                suma=suma+L(i,p)*z(p);
            end
            z(i)=(b(i)-suma)/L(i,i); %obtencion del vector Z
        end
        for i=n:-1:1
            suma=0;
            for p=(i+1):n
                suma = suma+u(i,p)*x(p);
            end
            x(i)=(z(i)-suma)/u(i,i); % solcion, calculos de las variables
        end    
    else
        fprintf('\nEl determinante es igual a cero, por lo tanto el sistema tiene infinita o ninguna solucion\n')
    end
end
    fprintf('\n Matriz Ab:\n')
    disp(C)
    fprintf('\n Matriz L:\n')
    disp(L)
    fprintf('\n Matriz U:\n')
    disp(u)
    fprintf('\n El vector Z:\n')
    disp(z)
fprintf('\n\nLa solucion de X1 hasta Xn es:\n');
  %a continuacion de utiliza una instruccion for, para mostrar el usuario, 
%los resultados de una manera mas ordenada
for i=1:n
    xi=x(1,i);
    fprintf('\nX%g=',i)
    disp(xi);
end
