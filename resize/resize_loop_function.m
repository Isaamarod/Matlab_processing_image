%resize_loop_function('C:\Users\cober\Desktop\FASE_6\test','C:\Users\cober\Desktop\FASE_6\test',512,512)
function resize_loop_function (pathname_input,pathname_output,x_size,y_size)
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
    I2 = imresize(I1,[x_size, y_size]);
    if (size(I1,3)==3)%check image dimensions if 3 convert2gray
        I2=rgb2gray(I2);% use if the image containing RGB value 3
    end
    fullFileName_o = fullfile(pathname_output, baseFileName);
    fprintf(1, 'Now wrinting %s\n', fullFileName_o);
    imwrite(I2,fullFileName_o);
end
end