filename_input = 'C:\Users\cober\Desktop\pruebesita\';
filename_output = 'C:\Users\cober\Desktop\';

%patron imagenes entrada 1 
filePattern = fullfile(filename_input, '*.jpg');
jpegFiles = dir(filePattern); %todas las imagenes jpg
for k = 1:length(jpegFiles) %recorre todas las imagenes
  baseFileName = jpegFiles(k).name;%nombre de la imagen
  fullFileName = fullfile(filename_input, baseFileName); %coger la ruta de la imagen completa 'C:\Users\cober\Desktop\prueba_matlab\blur_20_RBG_-100_test_con'+nombre
  fprintf(1, 'Now reading %s\n', fullFileName);  
  %procesamos
  %%cogemos la imagen de entrada con la ruta completa devuelve 256x256x3 y necesito 256x256
  f_ori = imread(fullFileName); 
    %% test a gray image 
    
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
    f_o=imshow(f_seg);
    nombre_salida=strcat('fuzzy_gray_norm_norm_',baseFileName);  
    fullFileName_o = fullfile(filename_output, nombre_salida);
    fprintf(1, 'Now writting %s\n', nombre_salida);  
    export_fig(fullFileName_o);
end