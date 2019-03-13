srcFiles = dir('C:\Users\cober\Desktop\FASE_6\FASE_6_DL\test_resized\*.png');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
filename = strcat('C:\Users\cober\Desktop\FASE_6\FASE_6_DL\test_resized\',srcFiles(i).name);
im = imread(filename);
k=imresize(im,[256,256]);
newfilename=strcat('C:\Users\cober\Desktop\FASE_6\FASE_6_DL\test_resized_256\',srcFiles(i).name);
imwrite(k,newfilename,'png');
end  