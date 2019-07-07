addpath('../export_fig-master')
filename_input = 'F:\keras_split_CV_256_balanced_all_filters\keras_split_CV_256_balanced\CV_1\train\3';%ruta imagenes entrada en bruto
filename_output = 'F:\keras_split_CV_256_balanced_all_filters\keras_split_CV_256_balanced_BSE\CV1\train\3';%ruta imagenes entrada en bruto
%filename_output_fc='F:\keras_split_CV_256_balanced\keras_split_CV_256_balanced_fuzzy_colormap\CV2\test\1';%ruta imagenes salida

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
  %puede haber programas en los que la convención interna se ha convertido en que las imágenes bidimensionales son siempre dobles () 
  %pero las imágenes tridimensionales a menudo son uint8 ().
  im2double (A);
  %comprobacion si RGB o gray
  % probar si la tercera dimensión tiene un tamaño mayor que 1, ya que será 1 para las matrices bidimensionales y será 3 para las matrices RGB.
  %si A es una imagen a color
  if (size(A,3)==3)
  %%convertimos a 256x256 de nuevo conseguimos una imagen en escala de
  %%grises mucho mas clara     
      A=rgb2gray(A);  
  end
% Threshold the image to make a binary image.
thresholdValue = 100;
binaryImage = A > thresholdValue;
labeledImage = bwlabel(binaryImage);		% Assign label ID numbers to all blobs.
binaryImage = ismember(labeledImage, 1);
binaryImage = imdilate(binaryImage, true(5));

 % Mask out the skull from the original gray scale image.
skullFreeImage = A; % Initialize
skullFreeImage(binaryImage) = 0; % Mask out.
imshow(skullFreeImage, []);
nombre_salida=strcat('bse_',baseFileName);  
fullFileName_o = fullfile(filename_output, nombre_salida);
fprintf(1, 'Now writting %s\n', nombre_salida);  
export_fig(fullFileName_o);
end


