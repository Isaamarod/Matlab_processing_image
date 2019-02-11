addpath('C:\Users\cober\Documents\MATLAB_2\export_fig-master');
%1.Como entrada recibimos imagenes a las que hemos aplicado un filtro colormap 256x256x3 
%2.Devuelve un archivo tipo 256x256x3
%3.Aplicamos una funcion color2gray para convertirlo de nuevo a 256x256
%4.Volvemos a aplicar colormap conseguimos 256x256x3
%5.Aplicamos FCM

filename_input = 'C:\Users\cober\Desktop\salidas_investigacion_imagenes_glioma\conjunto_comprueba_si_rgb_solo_blur';%ruta imagenes entrada ya con colormap
filename_output_1='C:\Users\cober\Desktop\salidas_investigacion_imagenes_glioma\salida_conjunto_comprueba_si_rgb';%ruta imagenes salida
filename_output_2='C:\Users\cober\Desktop\salidas_investigacion_imagenes_glioma\salida_conjunto_comprueba_si_rgb';%ruta imagenes salida

if ~isdir(filename_input)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', filename_input);
  uiwait(warndlg(errorMessage));
  return;
end

if ~isdir(filename_output_1)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', filename_output_1);
  uiwait(warndlg(errorMessage));
  return;
 end


%patron imagenes entrada 1 
filePattern = fullfile(filename_input, '*.jpg');
jpegFiles = dir(filePattern); %todas las imagenes jpg
%patron imagenes entrada 2
filePattern_2 = fullfile(filename_output_2, '*.jpg');
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
  %%aplicamos filtro colormap
  im=imshow(A,'Colormap',jet(255));     
  %saveas(salida_array,fullFileName_o); %%descartado porque me cambia el
  %tamano de la img al guardar
  nombre_salida=strcat('colormap2_',baseFileName);
  fullFileName_o_color_map = fullfile(filename_output_1, nombre_salida);
  %estas imagenes que se guarden tendran el colormapx2
  export_fig(fullFileName_o_color_map);
  for k_2 = 1:length(jpegFiles_2) %recorre todas las imagenes
  baseFileName_2 = jpegFiles_2(k_2).name;%nombre de la imagen
  fullFileName_2 = fullfile(filename_output_1, baseFileName_2); %coger la ruta de la imagen completa 'C:\Users\cober\Desktop\prueba_matlab\blur_20_RBG_-100_test_con'+nombre
  fprintf(1, 'Now reading %s\n', fullFileName_2);    
  f_ori=imread(fullFileName_2);
  cluster=5; % the number of clustering centers
  se=3; % the parameter of structuing element used for morphological reconstruction
  w_size=5; % the size of fitlering window
%% test a color image
  fileID='colormap';
  %GT=load('12003.mat'); % Ground Truth, download from 'https://www2.eecs.berkeley.edu/Research/Projects/CS/vision/grouping/resources.html'
 %% implement the proposed algorithm
  tic 
  [~,U1,~,~]=FRFCM_c(double(f_ori),cluster,se,w_size);
  Time1=toc;
  disp(strcat('running time is: ',num2str(Time1)))
  f_ori;
  f_seg=fcm_image_color(f_ori,U1);
  colormap default
  im_seg=imshow(f_seg);  
  nombre_salida_2=strcat('fuzzy_',baseFileName_2);  
  fullFileName_o = fullfile(filename_output_2, nombre_salida_2);
  fprintf(1, 'Now writting %s\n', nombre_salida_2);  
  export_fig(fullFileName_o);
  end 
  end
end