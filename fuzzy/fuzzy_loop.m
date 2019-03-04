%addpath('C:\Users\cober\Documents\Matlab_processing_image\export_fig-master');
addpath('C:\Users\cober\Documents\Matlab_processing_image\');
%1.Como entrada recibimos imagenes a las que hemos aplicado un filtro colormap 256x256x3 
%2.Devuelve un archivo tipo 256x256x3
%3.Aplicamos una funcion color2gray para convertirlo de nuevo a 256x256
%4.Volvemos a aplicar colormap conseguimos 256x256x3
%5.Aplicamos FCM

filename_input = 'C:\Users\cober\Documents\Matlab_processing_image\imags_E_S\fase_5_prueba\fase_5_colormap2\';%ruta imagenes entrada ya con colormap
filename_output_2='C:\Users\cober\Documents\Matlab_processing_image\imags_E_S\fase_5_prueba\fase5_fuzzy\';%ruta imagenes salida

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

for k_2 = 1:length(jpegFiles) %recorre todas las imagenes
  baseFileName_2 = jpegFiles(k_2).name;%nombre de la imagen
  fullFileName_2 = fullfile(filename_input, baseFileName_2); %coger la ruta de la imagen completa 'C:\Users\cober\Desktop\prueba_matlab\blur_20_RBG_-100_test_con'+nombre
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
