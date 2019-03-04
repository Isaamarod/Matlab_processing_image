%create label txt if labels are provided
% txt structure --> image_name label
%                    image_name_1 label
%                     ...

function function_of_generate_labels_loop(name_img,label,txt_path)
% name_img=sprintf('hola');
% label=1;
% txt_path='C:\Users\cober\Desktop\pruebesita\prueba_name_labels.txt';
y=fopen(txt_path,'a');
label=num2str(label);
label=sprintf('%s\n',label);
name_label=sprintf('%s %s',name_img,label);
fprintf(y,name_label); %for to draw
fprintf('Processing image file and label %s\n',name_label);
fclose(y);                      
end


   