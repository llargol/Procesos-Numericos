%Este programa halla la soluci�n al sistema Ax=b y la factorizaci�n LU de A
%usando el m�todo de Doolittle

%Entradas: 
%A, matrix invertible
%b, vector constante

%Salidas
%x, soluci�n
%L, matriz L de la factorizaci�n
%U, matriz U de la factorizaci�n

%Creado por: Samir Posada
%�ltima actualizaci�n: 16/07/2020

function [x,L,U]=C14_Doolittle(A,b)

%Inicializaci�n
n=size(A,1);
L=eye(n); 
U=eye(n);

%Factorizaci�n
for i=1:n-1
    for j=i:n
        U(i,j)=A(i,j)-dot(L(i,1:i-1),U(1:i-1,j)');
    end
    for j=i+1:n
        L(j,i)=(A(j,i)-dot(L(j,1:i-1),U(1:i-1,i)'))/U(i,i);
    end
end
U(n,n)=A(n,n)-dot(L(n,1:n-1),U(1:n-1,n)');

%Entrega de resultados
z=sustprgr([L b]);
x=sustregr([U z]);     
end