%SCRIPT DE NORMALIZACIÓN DE TODAS LAS IMÁGENES DE LA DB DE LA FASE 2 TRAIN
%Y TEST


%leer rutas test y train
%imread para crear matriz unit8 de cada imagen
%algunas en RGB convertir a gray todas por si acaso
%modificar etiquetas despues
%guardar en train/test de FASE_3
%

%%Addinf dependencies

addpath('C:\Users\cober\Documents\MATLAB_2\export_fig-master');
addpath('C:\Users\cober\Documents\MATLAB_2\object_array');
%%input/output foldera
filename_input = 'C:\Users\cober\Desktop\sin_norm_faltan_FASE_3_test';%input images phase_2
filename_output='C:\Users\cober\Desktop\con_norm_faltan_FASE_3_test';%output imagenes

if ~isdir(filename_input)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', filename_input);
  uiwait(warndlg(errorMessage));
  return;
end

if ~isdir(filename_output)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', filename_output);
  uiwait(warndlg(errorMessage));
  return;
end


%patron imagenes entrada 1 
filePattern = fullfile(filename_input, '*.jpg');
jpegFiles = dir(filePattern); %todas las imagenes jpg
%patron imagenes entrada 2
filePattern_2 = fullfile(filename_output, '*.jpg');
jpegFiles_2 = dir(filePattern_2); %todas las imagenes jpg

for k = 1:length(jpegFiles) %recorre todas las imagenes
  baseFileName = jpegFiles(k).name;%nombre de la imagen
  fullFileName = fullfile(filename_input, baseFileName); %coger la ruta de la imagen completa 'C:\Users\cober\Desktop\prueba_matlab\blur_20_RBG_-100_test_con'+nombre
  fprintf(1, 'Now reading %s\n', fullFileName);  
  %procesamos
  %%cogemos la imagen de entrada con la ruta completa devuelve 256x256x3 y necesito 256x256
  A = imread(fullFileName); 
  %puede haber programas en los que la convención interna se ha convertido en que las imágenes bidimensionales son siempre dobles () 
  %pero las imágenes tridimensionales a menudo son uint8 ().
  %comprobacion si RGB o gray
  % probar si la tercera dimensión tiene un tamaño mayor que 1, ya que será 1 para las matrices bidimensionales y será 3 para las matrices RGB.
  %si A es una imagen a color
  if (size(A,3)==3)
  %%convertimos a 256x256 de nuevo conseguimos una imagen en escala de
  %%grises mucho mas clara     
      A=rgb2gray(A);
  end
 %%normalizamos MinMax Scaler
  normalizedImage = uint8(255*mat2gray(A));  
  fprintf(1, 'Normalized image %s\n', fullFileName); 
  imshow(normalizedImage); 
  nombre_salida_norm=strcat('norm_',baseFileName);  
  fullFileName_o = fullfile(filename_output, nombre_salida_norm);
  fprintf(1, 'Now writting %s\n', fullFileName_o);    
  export_fig(fullFileName_o);   
       
end

