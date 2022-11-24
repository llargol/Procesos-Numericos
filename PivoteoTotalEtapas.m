% ELIMINACION GAUSSIANA CON PIVOTEO TOTAL (SOLUCION POR ETAPAS)

clc  %permite borrar el area de trabajo
clear  %permite borrar las variables almacenadas
format long

fprintf('                     ELIMINACION GAUSSIANA CON PIVOTEO TOTAL (SOLUCION POR ETAPAS)\n\n\n');
%fprintf me permite ingresar comentarios de manera textual que pueden
%orientar al usuario en el uso del programa

%input es un comando de solicitud de entrada de datos del usuario.
A=input('Ingrese la matriz A = \n');
b=input('\nIngrese el vector b, correspondite a los terminos independientes b=\n');
% Las matrices A y b deben ser ingresadas entre corchetes separando las
%columnas mediante coma ',' y las filas mediante punto y coma ';'.

%permite obtener el tamaño de la matriz A
[n,m]=size(A);
C=[A,b];
% la matriz C, representa la forma de la matriz aumentada [Ab]

fprintf('\nLa Matriz C, que corresponte a la matriz aumentada [Ab] es = \n');
disp(C) % la funcion disp nos permite imprimir una variable en el espacio de trabajo

if n==m %compara el numero de columnas y filas, para observar si son iguales
    for i=1:n
        marca(i)=i; %este vector nos permite obtener la posicion de las 
                    %varibles despues de los cambios
    end
    for k=1:(n-1)
        fprintf('\n ETAPA %g=\n\n',k)
        mayor=0; %asigna como cero el numero mayor de la fila
        filam=k; %asigna la fila k como la fila que tiene el numero mayor
        columnam=k; %asigna la columna k como la columna que tiene el numero mayor
        for p=k:n
            for r=k:n
                if mayor<abs(C(p,r)) %se compara para buscar el numero mayor
                mayor=abs(C(p,r)); %cambio de numero mayor
                filam=p; %cambio de fila
                columnam=r; %cambio de columna
                end
            end
        end
         if mayor ==0
            fprintf('\nEl sistema tiene infinitas soluciones\n')
            break%se interrumpe el programa con la instruccion break, ya que 
                  %si mayor=o, mas adelante se obtiene una division por
                  %cero
         else
           if filam ~= k 
            for j=1:(n+1)
                aux=C(k,j);%para poder intercambiar las variables, utilizamos una
                            %variable auxiliar
                C(k,j)=C(filam,j);
                C(filam,j)=aux;
            end
           end
            if columnam ~= k 
            for i=1:n
                aux=C(i,k);%para poder intercambiar las variables, utilizamos una
                            %variable auxiliar
                C(i,k)=C(i,columnam);
                C(i,columnam)=aux;
            end
            aux = marca(k);%para poder intercambiar las variables, utilizamos una
                            %variable auxiliar
            marca(k)= marca(columnam);
            marca(columnam)=aux;
            end
         end
         fprintf('\nLa matriz correspondiente a esta etapa antes del proceso:\n')
         
         disp(C)
         fprintf('\nLos Multiplicadores correpondientes a esta etapa son:\n')
         for i=(k+1):n
            m(i,k)=C(i,k)/C(k,k); %formula multiplicadores
            fprintf('\nm(%g,%g)=',i,k)
            disp(m(i,k));
            for j=k:(n+1)
                C(i,j)= C(i,j) - m(i,k)*C(k,j); %formula nueva fila
            end
         end
         fprintf('\nLa matriz correspondiente a esta etapa despues del proceso:\n')
         disp(C)
    end
     fprintf('\nEl vector de marcas final es:\n')
            marca(columnam)=aux
     for i=n:-1:1
            suma=0;
               for p=(i+1):n
                suma = suma + C(i,p)*X(p);
               end
            X(i)=(C(i,n+1)-suma)/C(i,i);
             %formula de la susticion regresiva y solucion de las variables
     end
     %la siguiente parte del programa ordena las varibles, tomando en
     %cuenta la marca final y los retoma con su coeficiente a la marca
     %inicial
         for i=1:n
             for j=1:n
                 if marca(j)==i
                     k=j;
                 end
             end
             aux=X(k);%para poder intercambiar las variables, utilizamos una
                            %variable auxiliar
             X(k)=X(i);
             X(i)=aux;
             aux=marca(k);%para poder intercambiar las variables, utilizamos una
                            %variable auxiliar
             marca(k)=marca(i);
             marca(i)=aux;
         end
else %funcion asignada del if, en caso de que este sea falso
     fprintf('\nERROR: La matriz NO es cuadrada\n');
end
fprintf('\n\n SOLUCION:\n');
fprintf('\n\nLa matriz Ab final:\n');
C
fprintf('\n\nLa solucion de X1 hasta Xn es:\n');

%a continuacion de utiliza una instruccion for, para mostrar el usuario, 
%los resultados de una manera mas ordenada
for i=1:n
    Xi=X(1,i);
    fprintf('\nX%g=',i)
    disp(Xi);
end
    
             
    