function [Wh, Bh, Wo, Bo, MSE] = train(TrX, TrY)
%%Inicializacion de las matrices de pesos y bias
%Las matrices de pesos contienen en cada fila los
%pesos que conectan UNA neurona con TODAS las entradas
Wh = rand(500, 784);
Wo = rand(10, 500);
Bh = rand(500,1);
Bo = rand(10,1);
alpha = 0.1;
MSE = [] ;

[~,nElem] = size(TrX);

for iterator = 1:50
    error = 0;
    %acierto = 0;

   for i = 1:nElem
       [Ah, Ao] = model(TrX(:,i),Wh, Wo,Bh, Bo);
       %C�lculo del sumatorio del MSE
       error = error + sum((TrY(i,:) - Ao' ).^2);
       %%Descomentar en el caso de querer monitorizar el porcentaje
       %%de acierto sobre el conjunto de entrenamiento en cada iteraci�n.
       %if (oneHotToDec(Ao') == oneHotToDec(TrY(i,:)))
           %acierto = acierto+1;
       %end
       
       [Wh, Bh, Wo, Bo] = backpropagation(Ah, Ao, Wh, Wo, Bh, Bo, TrY(i, :), TrX(:,i), alpha);
       
   end
   
   %fprintf('Iteracion : %d \n', iterator);
   %fprintf('Acierto : %f \n', 100/nElem*acierto);
   MSE = [MSE; error/nElem];
   if (error/nElem)  == 100
       break;
   end

end


end





    