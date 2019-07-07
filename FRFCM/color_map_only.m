addpath('C:\Users\cober\Documents\MATLAB_2\export_fig-master');
filename_input = 'C:\Users\cober\Documents\Matlab_processing_image\imags_E_S\fase_5_prueba\fase_5_colormap2_fuzzy\';%ruta imagenes entrada
filename_output='C:\Users\cober\Documents\Matlab_processing_image\imags_E_S\fase_5_prueba\fase_5_colormap2_fuzzy';%ruta imagenes salida
if ~isdir(filename_input)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', filename_input);
  uiwait(warndlg(errorMessage));
  return;
end
filePattern = fullfile(filename_input, '*.jpg');
jpegFiles = dir(filePattern); %todas las imagenes jpg
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
  %%convertimos a 256x256
  %I=rgb2gray(A); 
  %%aplicamos filtro colormap
  im=imshow(A,'Colormap',jet(255));   

  nombre_salida=strcat('colormap_',baseFileName);
  fullFileName_o = fullfile(filename_output, nombre_salida);
  %saveas(salida_array,fullFileName_o); %%descartado porque me cambia el
  %tamano de la img al guardar
  export_fig(fullFileName_o);
end