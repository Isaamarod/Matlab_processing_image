srcFiles = dir('C:\Users\cober\Desktop\FASE_6_DL\train\*.png');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
filename = strcat('C:\Users\cober\Desktop\FASE_6_DL\train\',srcFiles(i).name);
im = imread(filename);
k=imresize(im,[512,512]);
newfilename=strcat('C:\Users\cober\Desktop\train_resized\',srcFiles(i).name);
imwrite(k,newfilename,'png');
end