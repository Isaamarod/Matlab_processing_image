srcFiles = dir('C:\Users\cober\Desktop\FASE_6\FASE_6_DL\keras_split_CV\CV_1\train\3\*.png');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
filename = strcat('C:\Users\cober\Desktop\FASE_6\FASE_6_DL\keras_split_CV\CV_1\train\3\',srcFiles(i).name);
im = imread(filename);
k=imresize(im,[256,256]);
newfilename=strcat('C:\Users\cober\Desktop\FASE_6\FASE_6_DL\keras_split_CV_256\CV_1\train\3\',srcFiles(i).name);
imwrite(k,newfilename,'png');
end  