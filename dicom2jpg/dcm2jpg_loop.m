clear all
clc
close all

%based on https://es.mathworks.com/matlabcentral/fileexchange/49882-dicom-to-any-image-format-converter
pathname_input= 'C:\Users\cober\Desktop\DICOM IMAGENES EN BRUTO\DCM_SIN';%DICOM path
pathname_output= 'C:\Users\cober\Desktop\JPG IMAGENES EN BRUTO\JPG_SIN';%JPG outpath

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
filePattern_i = fullfile(pathname_input, '*.dcm');
dcmFiles = dir(filePattern_i); %todas las imagenes jpg


%for check loop

for k = 1:length(dcmFiles) %recorre todas las imagenes
  baseFileName = dcmFiles(k).name;%nombre de la imagen
  fullFileName = fullfile(pathname_input, baseFileName); %coger la ruta de la imagen completa 'C:\Users\cober\Desktop\prueba_matlab\blur_20_RBG_-100_test_con'+nombre
  fprintf(1, 'Now reading %s\n', fullFileName); 
  %reading dicom image
  [X,MAP]=dicomread(fullFileName);
  image8 = uint8(255 * mat2gray(X));
  %save output image jpg format deleting .dcm in basefilename and change to
  %.jpg
  baseFileName=strrep(baseFileName,'.dcm','.jpg');
  fullFileName_o = fullfile(pathname_output, baseFileName);
  imwrite(image8,fullFileName_o,'jpg');% Save Image as Jpeg format
  fprintf(1, 'Now writting %s\n', fullFileName_o);  
end;



