I1=imread('F:\keras_split_CV_256_balanced_all_filters\keras_split_CV_64_balanced_BSE\CV1\test\1\bse_3.png');
I2 = imresize(I1,[64 64]); 
if (size(I1,3)==3)%check image dimensions if 3 convert2gray
      I2=rgb2gray(I2);% use if the image containing RGB value 3
end 
imwrite(I2,'F:\keras_split_CV_256_balanced_all_filters\keras_split_CV_64_balanced_BSE\CV1\test\1\bse_3_2.png') ;