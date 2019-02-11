clear all
clc
close all
%based on https://es.mathworks.com/matlabcentral/fileexchange/49882-dicom-to-any-image-format-converter

pathname= 'C:\Users\cober\Documents\MATLAB_DICOM_TO_JPG';%ruta imagenes entrada ya con colormap
filename='000000-pac5.dcm';

%check path exist 
[X,MAP]=dicomread(fullfile(pathname, filename));
image8 = uint8(255 * mat2gray(X));
imwrite(image8,'myfile.jpg', 'jpg');% Save Image as Jpg format

