srcFiles = dir('F:\keras_split_CV_256_balanced_all_filters\keras_split_CV_64_balanced_colormap\CV1\train\2\*.png');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
filename = strcat('F:\keras_split_CV_256_balanced_all_filters\keras_split_CV_64_balanced_colormap\CV1\train\2\',srcFiles(i).name);
im = imread(filename);
k=imresize(im,[64,64]);
newfilename=strcat('F:\keras_split_CV_256_balanced_all_filters\keras_split_CV_64_balanced_colormap\CV1\train\2\',srcFiles(i).name);
imwrite(k,newfilename,'png');
end  