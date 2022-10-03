%Busquedas Incrementales: Ingresa la funcion f(x), Ingresa valor inicial de x
%(x0), el tamaño de paso(delta) y el numero de iteraciones deseadas (iter).

function [s] = busquedas_incrementales
    
    format long
    
    syms x
    
    f=input('Ingrese la funcion f(x):');
    delta=input('Ingrese el tamaño de paso (delta):');
    iter=input('Ingrese el maximo numero de iteraciones deseadas:');
    
    fplot(f), grid on
    %saveas(gcf,'Busquedas Incrementales.fig');
         
    x0=input('Ingrese el valor inicial (x0):');
    
    f0=eval(subs(f,x0));
    
    if f==0
        s=x0;
        fprintf('%f es raiz de la funcion f(x)',x0)
   
    else
        x1=x0+delta;
        c=1;                 
        f1=eval(subs(f,x1));
        
        while f0*f1>0 && delta~=0 && c<iter
            x0=x1;
            f0=f1;
            x1=x0+delta;
            f1=eval(subs(f,x1));
            c=c+1;
        end
        
        if f1==0             
            s=x1;
            fprintf('%f es raiz de la funcion f(x)',x1)
        
        elseif f0*f1<0                             
            s=x1;
            fprintf('Existe una raiz de la funcion f(x) entre %f y %f',x0,x1)
        
        else                                       
            s=x1;
            fprintf('Fracaso en %d iteraciones',iter) 
        end        
    end
    
end