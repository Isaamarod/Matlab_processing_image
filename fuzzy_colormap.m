% Please cite the paper "Tao Lei, Xiaohong Jia, Yanning Zhang, Lifeng He, Hongying Meng and Asoke K. Nandi, Significantly Fast and Robust
% Fuzzy C-Means Clustering Algorithm Based on Morphological Reconstruction and Membership Filtering, IEEE Transactions on Fuzzy Systems,
% DOI: 10.1109/TFUZZ.2018.2796074, 2018.2018"
%and
%Tao. Lei, Yanning Zhang, Yi Wang, Shigang Liu, and Zhe Guo, "A Conditionally Invariant Mathematical Morphological Framework for Color Images," 
%Information Sciences, Vol. 387, no. 5, pp. 34-52, May. 2017. 

% The first paper is OpenAccess and you can download the paper freely from "http://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=8265186."
% The code was written by Tao Lei in 2017.
% If you have any problems, please contact me. 
% Email address: leitao@sust.edu.cn
clc
close all    
clear all   
%% parameters
%filename_output='C:\Users\cober\Desktop\prueba_matlab\blur_20_RBG_-100_test_con-salida_fuzzy_c_means_colormap\';%ruta imagenes salida
filename_output='C:\Users\cober\Desktop';%ruta imagenes salida

cluster=7; % the number of clustering centers
se=3; % the parameter of structuing element used for morphological reconstruction
w_size=5; % the size of fitlering window
%% test a color image
fileID='colormap';
f_ori=imread('colomap_colomap_blur_20_RBG_-100_test_con-017.jpg');
GT=load('12003.mat'); % Ground Truth, download from 'https://www2.eecs.berkeley.edu/Research/Projects/CS/vision/grouping/resources.html'
%CISA f_ori=double(f_ori);

%% implement the proposed algorithm
tic 
[~,U1,~,~]=FRFCM_c(double(f_ori),cluster,se,w_size);
Time1=toc;
disp(strcat('running time is: ',num2str(Time1)))
f_ori;
f_seg=fcm_image_color(f_ori,U1);
colormap default
imshow(f_seg);
 
%%convertimos a 256x256
%I=rgb2gray(f_seg); 
  %%aplicamos filtro colormap
%im=imshow(I,'Colormap',jet(255));   
nombre_salida_p='fuzzy_colomap_colomap_blur_20_RBG_-100_test_con-017.jpg';
nombre_salida=strcat('fuzzy_colomap_colormap_',nombre_salida_p);
fullFileName_o = fullfile(filename_output, nombre_salida);
export_fig(fullFileName_o);


