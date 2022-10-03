%Secante: Ingresa la funcion f(x), los valores iniciales (x0,x1), la
%tolerancia del error (tol) y el numero de iteraciones deseado (iter).

function [val] = secante
    
    format long

    syms x

    f=input('Ingrese la funcion f(x):');   
    tol=input('Ingrese la tolerancia deseada:'); 
    iter=input('Ingrese el numero maximo de iteraciones deseado:'); 
    fplot(f), grid on
    %saveas(gcf,'Secante.fig');
    
    x0=input('Ingrese el valor inicial (x0):');

    x1=input('Ingrese el valor inicial (x1):');
    
        c=0;
        fm(c+1)=eval(subs(f,x0));
        fe0=fm(c+1);
        n(c+1)=c;
        E(c+1)=tol+2;
        xn(c+1)=x0;
        
        if fe0==0
            s=x0;
            i=c;
            fprintf('%f es raiz de la funcion f(x)',x0)
        end
        
        c=c+1;
        fm(c+1)=eval(subs(f,x1));
        fe=fm(c+1);
        den=fe-fe0;
        denm(c+1)=den;
        n(c+1)=c;
        E(c+1)=tol+1;
        error=E(c+1);
        xn(c+1)=x1;
        
        while error>tol && fe~=0 && den~=0 && c<iter
            xn(c+2)=x1-(fe*(x1-x0)/den);
            E(c+2)=abs(xn(c+2)-x1);
            %E(c+2)=abs((xn(c+2)-x1)/xn(c+2));
            error=E(c+2);
            x0=x1;
            fe0=fe;
            x1=xn(c+2);
            fm(c+2)=eval(subs(f,x1));
            fe=fm(c+2);
            den=fe-fe0;
            denm(c+2)=den;
            n(c+2)=c+1;                                                   
            c=c+1; 
        end
        
        if fe==0
           i=c;         
           fprintf('%f es raiz de la funcion f(x)',x1)

        elseif error<tol
           i=c;
           fprintf('%f es la aproximacion a una raiz de la funcion f(x) con tolerancia de %f',x1,tol)

        elseif den==0
           i=c;
           fprintf('%f es posiblemente una raiz multiple de la funcion f(x)',x0)
        
        else 
           i=c;
           fprintf('Fracaso en %d iteraciones',iter) 
        end

    var_names={'n','xn','fm','denm','Error'};
    val=table(n',xn',fm',denm',E','VariableNames',var_names);
    
    %writetable(val,'Secante.xlsx','Sheet',1)
        
end