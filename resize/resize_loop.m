clear all
clc
close all

%based on https://es.mathworks.com/matlabcentral/fileexchange/49882-dicom-to-any-image-format-converter
pathname_input= 'C:\Users\cober\Desktop\FASE_0_creation\JPG_SIN_TEST';%DICOM path
pathname_output= 'C:\Users\cober\Desktop\FASE_0_creation\JPG_SIN_TEST_resized';%JPG outpath

%check if paths exists

if ~isdir(pathname_input)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', pathname_input);
  uiwait(warndlg(errorMessage));
  return;
end

if ~isdir(pathname_output)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', pathname_output);
  uiwait(warndlg(errorMessage));
  return;
end

%path pattern
filePattern_i = fullfile(pathname_input, '*.jpg');
jpgFiles = dir(filePattern_i); %todas las imagenes jpg


%for check loop

for k = 1:length(jpgFiles) %recorre todas las imagenes
  baseFileName = jpgFiles(k).name;%nombre de la imagen
  fullFileName = fullfile(pathname_input, baseFileName); %coger la ruta de la imagen completa 'C:\Users\cober\Desktop\prueba_matlab\blur_20_RBG_-100_test_con'+nombre
  fprintf(1, 'Now reading %s\n', fullFileName); 
  I1=imread(fullFileName);
  I2 = imresize(I1,[256 256]); 
    if (size(I1,3)==3)%check image dimensions if 3 convert2gray
          I2=rgb2gray(I2);% use if the image containing RGB value 3
    end 
    fullFileName_o = fullfile(pathname_output, baseFileName);
    fprintf(1, 'Now wrinting %s\n', fullFileName_o); 
    imwrite(I2,fullFileName_o);
end