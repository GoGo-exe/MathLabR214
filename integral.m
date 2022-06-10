function []=integral() %main fonction
  function [ft] = f(t)
    ft = e^sin(t); %declaration de la fonction
  end
  format long     %plus de précision 
  a = 0;    %borne inférieur
  b = pi/2;    % borne supérieur
  n = 500;   %nombre d'intervalles
  
  
    function [integrale] = trapeze(a,b,n) % fontion méthode trapèze
      h = (b-a)/n ;   %déclaration de H car a et b sont divisés en sous intervales
      accolade = f(a) + f(b);
      for i = 1 : n - 1;
        accolade = accolade + 2 * (f(a + i*h));
      endfor
      integrale = ((b-a)/(2 * n)) * accolade;
      
    endfunction
      
  %trapeze(a,b,n)   %lance la fonction avec les bornes a et b ainsi que le nombres 
                   %d'intervale
  
    function [integrale] = simpson(a,b,n) % fontion méthode simpson
      h =(b-a)/(2*n);
      ko = h/3;
      nix = f(a)+f(b);
      for k = 1:(2*n-1)
        if mod(k,2)==0
          nix += f(a+(k*h))*2;
        else
          nix += f(a+(k*h))*4;
        endif
      endfor
      integrale = ko*nix;
    endfunction
  %simpson(a,b,n)
  
  
  function [integrale]=trapeze_precis(a,b,eps)%calcule précision de trapeze
    n=1;   %valeur de départ de n
    while abs(trapeze(a,b,2*n) - trapeze(a,b,n)) > eps
      n = 2*n;    %on multiplie n par 2
    endwhile
    n
    integrale = trapeze(a,b,2*n);  %celui ci a la précision voulu
  endfunction
  
    trapeze_precis(a,b,10^-3)
    
    
 function [integrale]=simpson_precis(a,b,eps)%calcule précision de simpson
    n=1;   %valeur de départ de n
    while abs(simpson(a,b,2*n) - simpson(a,b,n)) > eps
      n = 2*n;    %on multiplie n par 2
    endwhile
    n
    integrale = simpson(a,b,2*n);  %celui ci a la précision voulu
  endfunction
  
    simpson_precis(a,b,10^-3)
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 
endfunction
