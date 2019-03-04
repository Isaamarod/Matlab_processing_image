function  generate_label_name_strut(pathname,txt_path)
%pathname='C:\Users\cober\Desktop\1512427\all_matlab';
%txt_path='C:\Users\cober\Desktop\FASE_6\all.txt';
% Get list of all subfolders.
allSubFolders = genpath(pathname);
addpath(genpath('C:\Users\cober\Documents\Matlab_processing_image\generate_labels'))
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
            label=storedStructure.cjdata.label;
            label2=num2str(label);
            name=baseFileNames(f).name;
            fprintf('Processing image label %s\n', label2);
            fprintf('Processing image name %s\n', baseFileNames(f).name);
            function_of_generate_labels_loop(name,label2,txt_path);
           
		end
    else
		fprintf('Folder %s has no image files in it.\n', thisFolder);
	end
end
end

