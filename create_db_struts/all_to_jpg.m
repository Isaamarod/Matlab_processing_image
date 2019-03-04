%Loop all subfoldes extract and save all images in a folder
 function  [name,label2]=generate_jpg_imgs_strut(input_img_paths,save_img_path)

%pathname='C:\Users\cober\Desktop\1512427\';
%txt_path='C:\Users\cober\Desktop\pruebesita\prueba_name_labels.txt';
% Get list of all subfolders.
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
            image=storedStructure.cjdata.image;
            imwrite(image,save_img_path)
           
		end
    else
		fprintf('Folder %s has no image files in it.\n', thisFolder);
	end
end
end
