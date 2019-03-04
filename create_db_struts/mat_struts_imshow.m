% Load entire mat file contents into a structure.
load('C:\Users\cober\Documents\MATLAB\BD_publica_brain_cancer\1.mat')
% The structure has a member "I" that is a double 512x512 array.
storedStructure = load('1.mat');
% Extract out the image from the structure into its own variable.
% Don't use I as the variable name - bad for several reasons.
imageArray = storedStructure.cjdata.image;  % Or storedStructure.I depending on what members your structure has.
% Display the image in a brand new figure window.
figure(1);
% Display double image, scaled appropriately.
% No need to cast to uint8 - could even be bad
% if your double numbers don't span the 0-255 range nicely.
imshow(imageArray, []);

