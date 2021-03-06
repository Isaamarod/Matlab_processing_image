%SCRIPT DE NORMALIZACI�N DE TODAS LAS IM�GENES DE LA DB DE LA FASE 2 TRAIN
%Y TEST


%leer rutas test y train
%imread para crear matriz unit8 de cada imagen
%algunas en RGB convertir a gray todas por si acaso
%modificar etiquetas despues
%guardar en train/test de FASE_3
%

%%Addinf dependencies

addpath('../export_fig-master')
addpath('../object_array')
%%input/output foldera
filename_input = 'F:\keras_split_CV_256_balanced_all_filters\keras_split_CV_256_balanced_BSE\CV1\test\1';%input images phase_2
filename_output='F:\keras_split_CV_256_balanced_all_filters\keras_split_CV_256_balanced_BSE_norm\CV1\test\1';%output imagenes

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
filePattern = fullfile(filename_input, '*.png');
jpegFiles = dir(filePattern); %todas las imagenes jpg
%patron imagenes entrada 2
filePattern_2 = fullfile(filename_output, '*.png');
jpegFiles_2 = dir(filePattern_2); %todas las imagenes jpg

for k = 1:length(jpegFiles) %recorre todas las imagenes
  baseFileName = jpegFiles(k).name;%nombre de la imagen
  fullFileName = fullfile(filename_input, baseFileName); %coger la ruta de la imagen completa 'C:\Users\cober\Desktop\prueba_matlab\blur_20_RBG_-100_test_con'+nombre
  fprintf(1, 'Now reading %s\n', fullFileName);  
  %procesamos
  %%cogemos la imagen de entrada con la ruta completa devuelve 256x256x3 y necesito 256x256
  A = imread(fullFileName); 
  if (size(A,3)==3)
  %%convertimos a 256x256 de nuevo conseguimos una imagen en escala de
  %%grises mucho mas clara     
      A=rgb2gray(A);
  end
  %puede haber programas en los que la convenci�n interna se ha convertido en que las im�genes bidimensionales son siempre dobles () 
  %pero las im�genes tridimensionales a menudo son uint8 ().
  %comprobacion si RGB o gray
  % probar si la tercera dimensi�n tiene un tama�o mayor que 1, ya que ser� 1 para las matrices bidimensionales y ser� 3 para las matrices RGB.
  %si A es una imagen a color
  
 %%normalizamos MinMax Scaler
  normalizedImage = uint8(255*mat2gray(A));  
  holi = imresize(normalizedImage,[256,256]);
  imresize(holi,[256,256]);

  fprintf(1, 'Normalized image %s\n', fullFileName); 
  nombre_salida_norm=strcat('norm_',baseFileName);  
  fullFileName_o = fullfile(filename_output, nombre_salida_norm);
  fprintf(1, 'Now writting %s\n', fullFileName_o);    
  export_fig(fullFileName_o);   
       
end

