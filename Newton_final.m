%Este programa halla la solucion a la ecuacion f(x)=0 usando el metodo de
%Newton


%Entradas: 

%f, funcion continua
%f', funcion continua
%x0, aproximacion inicial 
%tol, tolerancia
%Nmax, numero maximo de iteraciones

%Salidas
%x, solucion
%iter, numero de iteraciones
%err, error


function Newton_final(f,df,x0,tol,Nmax)
syms x
F=input('Ingrese una funcion continua:');
f=inline(F);
dF=input('Ingrese la primera derivada:');
df=inline(dF);
x0=input('Ingrese una aproximacion inicial:');
tol=input('Ingrese una tolerancia:');
Nmax=input('Ingrese el numero maximo de iteraciones:');
Error=input('Ingrese 0 si requiere Error absoluto o 1 para Error relativo:');
%Inicializacion
xant=x0;
fant=f(xant);
def1=df(xant);  
E=tol+1; 
Er=tol+1;
cont=0;
ite=[]; %nuevo
ite(1)=0; %nuevo
ite(2)=1; %nuevo
raices(1)=x0; 
funcion_resultado(1)=fant;
derivada_resultados(1)=def1;
error(1)="N/A"; %nuevo
error(2)=E; 
errorrelativo(1)="N/A";
errorrelativo(2)=Er;


%Error absoluto
if Error==0
    

%Ciclo
while fant~=0 && def1~=0 && E>tol && cont<Nmax
  xact=xant-fant/def1;
  fact=f(xact);
  def1=df(xact);
  E=abs(xact-xant);
  cont=cont+1;
  ite(cont+1)=cont; %nuevo
  raices(1+cont)=xact; 
  funcion_resultado(1+cont)=fact;
  derivada_resultados(1+cont)=def1;
  error(1+cont)=E;
  xant=xact;
  fant=fact;
 
end
Ite=ite';
Raiz=raices'; 
fx=funcion_resultado';
Derivada= derivada_resultados';
error=error';
tabla=table(Ite, Raiz, fx, Derivada, error);
writetable(tabla,'Newton.xls')


%Entrega de resultados
if fant==0
    fprintf('Solucion\n')
    fprintf('%4.4f es raiz de la funcion %s \n',xact,fant)
    fprintf('Ite       Raiz       Funcion         Derivada           Error \n')
    fprintf('__________________________________________________________ \n')
    for j=1:cont
        fprintf('%d\t %4.4f \t %4.4f \t  %4.4f \t %4.4f \n',j-1,raices(j), funcion_resultado(j),derivada_resultados(j), error(j))             
    end  

elseif E<tol 
    fprintf('Solucion\n')
    fprintf('%4.4f es una aproximacion de la raiz con tolerancia de:  %4.4f\n',xact,tol) 
     fprintf('Ite \t RAIZ \t Funcion \t Derivada \t ERROR \n')
    for j=1:cont
        fprintf('%d \t %4.4f \t %4.4f \t  %4.4f \t %4.4f \n ',j-1,raices(j), funcion_resultado(j),derivada_resultados(j), error(j))             
    end  
   
elseif def1==0
    fprintf('Solucion\n')
    fprintf(' la derivada es 0 en la iteracion: %4.4f\n ',cont)  
    fprintf('EL METODO FALLO')          
   
else 
    fprintf('Solucion\n')
    fprintf('Se necesitan mas de %d iteraciones para obtener el resultado \n\n',Nmax)
    fprintf('ITERACION \t RAIZ \t Funcion \t Derivada \t ERROR \n')
    for j=1:cont
        fprintf('%d \t %4.4f \t %4.4f \t  %4.4f \t %4.4f \n ',j-1,raices(j), funcion_resultado(j),derivada_resultados(j), error(j))             
    end  
end


    
%Error relativo    
elseif Error==1

    
    
%Ciclo
while fant~=0 && def1~=0 && Er>tol && cont<Nmax
  xact=xant-fant/def1;
  fact=f(xact);
  def1=df(xact);
  Er=abs(xact-xant)/xact;
  cont=cont+1;
  ite(cont+1)=cont; %nuevo
  raices(1+cont)=xact; 
  funcion_resultado(1+cont)=fact;
  derivada_resultados(1+cont)=def1;
  errorrelativo(1+cont)=Er;
  xant=xact;
  fant=fact;
 
end
Ite=ite';
Raiz=raices'; 
fx=funcion_resultado';
Derivada= derivada_resultados';
errorrelativo=errorrelativo';
tabla=table(Ite, Raiz, fx, Derivada, errorrelativo);
writetable(tabla,'Newton.xls')


%Entrega de resultados
if fant==0
    fprintf('Solucion\n')
    fprintf('%4.4f es raiz de la funcion %s \n',xact,fant)
    fprintf('Ite       Raiz       Funcion         Derivada           Error relativo\n')
    fprintf('__________________________________________________________ \n')
    for j=1:cont
        fprintf('%d\t %4.4f \t %4.4f \t  %4.4f \t %4.4f \n',j-1,raices(j), funcion_resultado(j),derivada_resultados(j), errorrelativo(j))             
    end  

elseif Er<tol 
    fprintf('Solucion\n')
    fprintf('%4.4f es una aproximacion de la raiz con tolerancia de:  %4.4f\n',xact,tol) 
     fprintf('Ite \t RAIZ \t Funcion \t Derivada \t ERROR RELATIVO \n')
    for j=1:cont
        fprintf('%d \t %4.4f \t %4.4f \t  %4.4f \t %4.4f \n ',j-1,raices(j), funcion_resultado(j),derivada_resultados(j), errorrelativo(j))             
    end  
   
elseif def1==0
    fprintf('Solucion\n')
    fprintf(' la derivada es 0 en la iteracion: %4.4f\n ',cont)  
    fprintf('EL METODO FALLO')          
   
else 
    fprintf('Solucion\n')
    fprintf('Se necesitan mas de %d iteraciones para obtener el resultado \n\n',Nmax)
    fprintf('ITERACION \t RAIZ \t Funcion \t Derivada \t ERROR RELATIVO \n')
    for j=1:cont
        fprintf('%d \t %4.4f \t %4.4f \t  %4.4f \t %4.4f \n ',j-1,raices(j), funcion_resultado(j),derivada_resultados(j), errorrelativo(j))             
    end  
end
end


 %Gráfica
xcoordenado=linspace(0,10);
for i=1:length(xcoordenado)
    ycoordenado(i)=f(xcoordenado(i)); %NO SABEMOS
end
plot(xcoordenado,ycoordenado);
hold on
grid on 
ejex=zeros(100,1);
plot(xcoordenado,ejex,'--b')
plot(ejex,ycoordenado,'--b')
axis([-2 3 -10 10])

ylabel('Cantidad de material');
xlabel('Tiempo');
title('Resultados Newton');   
legend('f(x)','eje x','eje y')
end 