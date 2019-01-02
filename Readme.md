## STEPS AFTER DOWNLOAD THE CODE
### Input images atbs:
Execute in matlab prompt:


* `h = imshow('blur_20_RBG_-100_test_con-018.jpg');`
* `info = imfinfo('blur_20_RBG_-100_test_con-018.jpg');` 
* `imageinfo(h,info)`

It's important because in some functions in matlab you'll have to convert your image class. For example in this case:

1) input image class: uint8 256x256x3   --> color image 
2) Before colormap processing we have to convert to 256x256  --> convert to gray --> *color2gray.m* dependencie


![image_info_github](https://user-images.githubusercontent.com/35488726/48940049-956bf780-ef16-11e8-9791-434c1f185506.JPG)


## Code general dependencies in your path to add 
Download *export_fig.m* : [export_fig.m](https://github.com/altmany/export_fig)

###  **Dependencies for Colormap part**
Convert *color2gray.m*: [color2gray.m](https://es.mathworks.com/matlabcentral/fileexchange/8214-gray-image-to-color-image-conversion )

![colomap_blur_20_rbg_-100_test_con-018](https://user-images.githubusercontent.com/35488726/48941280-2e047680-ef1b-11e8-8e58-17d0e785f2e4.jpg)

### **Dependencies for Fuzzy c-means part**
Repository: [Fuzzy c-means](https://es.mathworks.com/matlabcentral/fileexchange/66181-image-segmentation-using-fast-fuzzy-c-means-clusering)

Install License Image Processing Toolbox
Add this function : [initfcm.m](https://stackoverflow.com/questions/21083197/how-to-generate-fixed-cluster-of-fuzzy-c-mean-in-matlab)

Important code observations: 
**m_color.m --> Number of clusters are relevant. For example:**
 * cluster=9
![fuzzy_cluster9_colomap_blur_20_rbg_-100_test_con-018](https://user-images.githubusercontent.com/35488726/48944691-141d6080-ef28-11e8-97fb-0b057054603a.jpg)
 * cluster=8
![fuzzy_cluster8_colomap_blur_20_rbg_-100_test_con-018](https://user-images.githubusercontent.com/35488726/48944774-6494be00-ef28-11e8-92c5-8dd23392c44e.jpg)
 * cluster=7
![fuzzy_cluster7_colomap_blur_20_rbg_-100_test_con-018](https://user-images.githubusercontent.com/35488726/48944957-f1d81280-ef28-11e8-9ad3-b829ce6e9534.jpg)
 * cluster=5
![fuzzy_cluster5_colomap_blur_20_rbg_-100_test_con-018](https://user-images.githubusercontent.com/35488726/48945086-5dba7b00-ef29-11e8-8ffb-03155f00f799.jpg)
 * cluster=2
![fuzzy_cluster2_colomap_blur_20_rbg_-100_test_con-018](https://user-images.githubusercontent.com/35488726/48945195-bc7ff480-ef29-11e8-8e10-3174bd221b81.jpg)








Please cite the paper 

T. Lei, X. Jia, Y. Zhang, L. He, H. Meng and A. K. Nandi, "Significantly Fast and Robust Fuzzy C-Means Clustering Algorithm Based on Morphological Reconstruction and Membership Filtering," in IEEE Transactions on Fuzzy Systems, vol. PP, no. 99, pp. 1-1.doi: 10.1109/TFUZZ.2018.2796074

Full paper link: http://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=8265186 

1. If you want to segment a gray image, please run main_gray.
2. If you want to segment a color image, please run main_color.
