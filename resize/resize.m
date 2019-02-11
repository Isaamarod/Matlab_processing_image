I1=imread('000000-pac7.jpg');
I2 = imresize(I1,[256 256]); 
if (size(I1,3)==3)%check image dimensions if 3 convert2gray
      I2=rgb2gray(I2);% use if the image containing RGB value 3
end 
imwrite(I2,'000000-pac7_resized.jpg') ;