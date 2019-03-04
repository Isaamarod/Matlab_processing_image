addpath('../export_fig-master/');
addpath('../object_array/');
addpath('../fuzzy/');
%1.Como entrada recibimos imagenes en blanco y negro en bruto que son 256x256 normalizadas //RUTA ENTRADA
%2.Aplicamos FCM para gray//GUARDAR EN RUTA SALIDA


filename_input = 'C:\Users\cober\Documents\Matlab_processing_image\imags_E_S\gray\';%ruta imagenes entrada en bruto
filename_output='C:\Users\cober\Documents\Matlab_processing_image\imags_E_S\fuzzy_gray_test_FCM\';%ruta imagenes salida

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
%patron imagenes salida
filePattern_2 = fullfile(filename_output, '*.png');
jpegFiles_2 = dir(filePattern_2); %todas las imagenes jpg


for k = 1:length(jpegFiles) %recorre todas las imagenes
  baseFileName = jpegFiles(k).name;%nombre de la imagen
  fullFileName = fullfile(filename_input, baseFileName); %coger la ruta de la imagen completa 'C:\Users\cober\Desktop\prueba_matlab\blur_20_RBG_-100_test_con'+nombre
  fprintf(1, 'Now reading %s\n', fullFileName);  
  %procesamos
  %%cogemos la imagen de entrada con la ruta completa devuelve 256x256x3 y necesito 256x256
   
  %% test a gray image 
  f_ori=imread(fullFileName);
  fn=imnoise(f_ori,'gaussian',0.03);
    %% parameters
  cluster=2; % the number of clustering centers
  se=3; % the parameter of structuing element used for morphological reconstruction
  w_size=3; % the size of fitlering window
    %% segment an image corrupted by noise
  tic 
  [center1,U1,~,t1]=FRFCM(double(fn),cluster,se,w_size);
  Time1=toc;
  disp(strcat('running time is: ',num2str(Time1)))
  f_seg=fcm_image(f_ori,U1,center1);
  imshow(fn,[]),title('Original image');
  figure,imshow(f_seg);title('segmentated result');
  im_seg=imshow(f_seg,[]);  
  nombre_salida=strcat('fuzzygray_',baseFileName);  
  fullFileName_o = fullfile(filename_output, nombre_salida);
  fprintf(1, 'Now writting %s\n', nombre_salida);  
  export_fig(fullFileName_o);   
  
 end


