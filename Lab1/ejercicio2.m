clear all
close all
clc
 
input_string = 'hola soy un string';
fprintf('El string original: %s\n\n', input_string)
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TODO: Agregar codigo para invertir string    %
% SUGERENCIA: Utilice una indexacion adecuada. %
% Por otro lado, este ejercicio puede ser      %
% resuelto facilmente utilizando la funcion    %
% interna fliplr, o flip. Utilice help para    %
% ver como funcionan. Resuelva el ejercicio    %
% de las dos formas posibles (indexacion       %
% flip). NO UTILICE CICLOS                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% Guarde sus resultados en la siguiente variable
output_string = input_string(end:-1:1);

% Alternativamente, se puede utilizar la funcion fliplr
%output_string = flip_lr(input_string);
 
fprintf('El string invertido: %s\n', output_string);