function  generate_db_folder_by_label(pathname,output_path,label)
% generate_db_folder_by_label('C:\Users\cober\Desktop\FASE_6_matlab\test','C:\Users\cober\Desktop\2','2')
% Get list of all subfolders.
addpath('..\export_fig-master');
allSubFolders = genpath(pathname);
% Parse into a cell array.
remain = allSubFolders;
listOfFolderNames = {};
while true
	[singleSubFolder, remain] = strtok(remain, ';');
	if isempty(singleSubFolder)
		break;
	end
	listOfFolderNames = [listOfFolderNames singleSubFolder];
end
numberOfFolders = length(listOfFolderNames);

    
% Process all image files in those folders.
for k = 1 : numberOfFolders
	% Get this folder and print it out.
	thisFolder = listOfFolderNames{k};
	fprintf('Processing folder %s\n', thisFolder);	
	% Now we have a list of all files in this folder.
	% Add on .mat files.
	filePattern = sprintf('%s/*.mat', thisFolder);
    baseFileNames = dir(filePattern);
	%baseFileNames = [baseFileNames; dir(filePattern)];
	numberOfImageFiles = length(baseFileNames);
	% Now we have a list of all files in this folder.
	if numberOfImageFiles >= 1
		% Go through all those image files.
		for f = 1 : numberOfImageFiles
			fullFileName = fullfile(thisFolder, baseFileNames(f).name);
			fprintf('Processing image file %s\n', fullFileName);
            storedStructure = load(fullFileName);
            label_img=storedStructure.cjdata.label;
            label2=num2str(label_img);            
            if(strcmp(label2,label))
                img=storedStructure.cjdata.image;
                img= imshow(img,[]);
                name=strrep(baseFileNames(f).name,'.mat','');
                full_o=fullfile(output_path,name);
                export_fig(full_o);   
            
                fprintf('Processing image label %s\n', label2);
                fprintf('Processing image name %s\n', baseFileNames(f).name);
            
            end 
		end
    else
		fprintf('Folder %s has no image files in it.\n', thisFolder);
	end
end
end
