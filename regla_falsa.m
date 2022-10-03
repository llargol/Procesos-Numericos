%Regla Falsa: Se ingresa la funcion f(x), el valor inicial (xi) y el valor
%final del intervalo (xs), la tolerancia del error (tol) y el numero maximo
%de iteraciones (iter).
  
function [val] = regla_falsa
    
    format long

    syms x
        
    f=input('Ingrese la funcion f(x):');
    tol=input('Ingrese la tolerancia deseada:');
    iter=input('Ingrese el numero maximo de iteraciones deseadas:');
    
    fplot(f), grid on
    %saveas(gcf,'Regla Falsa.fig');
    
    xi=input('Ingrese el valor inferior del intervalo (xi):');
    
    xs=input('Ingrese el valor superior del intervalo (xs):');
          
    fi=eval(subs(f,xi));
    fs=eval(subs(f,xs));
    
    if fi==0
        s=xi;
        E=0;
        fprintf('%f es raiz de la funcion f(x)',xi)
    
    elseif fs==0
        s=xs;
        E=0;
        fprintf('%f es raiz de la funcion f(x)',xs)
    
    elseif fs*fi<0
        c=0;
        xm=xi-(fi*(xs-xi)/(fs-fi));
        xmn=xm(c+1);
        fm(c+1)=eval(subs(f,xm));
        fe=fm(c+1);
        n(c+1)=c;
        E(c+1)=tol+1;
        error=E(c+1);
        
        while error>tol && fe~=0 && c<iter
            
            if fi*fe<0
                xs=xm;
                fs=eval(subs(f,xs));
            
            else
                xi=xm;
                fi=eval(subs(f,xi));
            end
            
            xa=xm;
            xm=(xi+xs)/2;
            xmn(c+2)=xm;
            fm(c+2)=eval(subs(f,xm));
            fe=fm(c+2);
            E(c+2)=abs(xm-xa);
            %E(c+2)=abs((xm-xa)/xm);
            error=E(c+2);
            c=c+1;
            n(c+1)=c;
        end
        
        if fe==0
           s=xm;
           fprintf('%f es raiz de la funcion f(x)',xm) 
        
        elseif error<tol
           s=xm;
           fprintf('%f es una aproximacion de una raiz de la funcion f(x) con una tolerancia de %f',xm,tol)
        
        else 
           s=xm;
           fprintf('Fracaso en %d iteraciones',iter) 
        end
        
    else
       fprintf('El intervalo utilizado es inadecuado')         
    end    

    var_names={'n','xmn','fm','Error'};
    val=table(n',xmn',fm',E','VariableNames',var_names);
    
    %writetable(val,'Regla Falsa.xlsx','Sheet',1)
    
end