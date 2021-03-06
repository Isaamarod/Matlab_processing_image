% Start with a folder and get a list of all subfolders.
% Finds and prints names of all PNG, JPG, and TIF images in 
% that folder and all of its subfolders.
clc;    % Clear the command window.
workspace;  % Make sure the workspace panel is showing.
format longg;
format compact;

pathname='C:\Users\cober\Desktop\FASE_5_preparation\';
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
 
    
	% Get PNG files.
        filePattern = sprintf('%s/*.png', thisFolder);
        baseFileNames = dir(filePattern);
        % Add on TIF files.
        filePattern = sprintf('%s/*.tif', thisFolder);
        baseFileNames = [baseFileNames; dir(filePattern)];
        % Add on JPG files.
        filePattern = sprintf('%s/*.jpg', thisFolder);
        baseFileNames = [baseFileNames; dir(filePattern)];
        numberOfImageFiles = length(baseFileNames);
        % Now we have a list of all files in this folder.
        
        if numberOfImageFiles >= 1
            % Go through all those image files.
                for f = 1 : numberOfImageFiles
                  fullFileName = fullfile(thisFolder, baseFileNames(f).name);

                   if strfind (fullFileName,'CON_TRAIN')
                       fid = fopen('train_con.txt','a'); 
                       fullFileName = fullfile(thisFolder, baseFileNames(f).name);
                       basefileName=strcat(baseFileNames(f).name,' 1\n');
                       fprintf(fid,basefileName);
                       fprintf('image name  %s\n',basefileName);
                       fclose(fid);
                       fprintf('Processing image file %s\n', fullFileName);
                   elseif strfind (fullFileName,'SIN_TRAIN')                                              
                           fullFileName = fullfile(thisFolder, baseFileNames(f).name);
                           fid_2 = fopen('train_sin.txt','a');  
                           basefileName=strcat(baseFileNames(f).name,' 0\n');
                           fprintf(fid_2,basefileName);
                           fprintf('image name  %s\n',basefileName);
                           fclose(fid_2);
                           fprintf('Processing image file %s\n', fullFileName);
                   end
                 end
        end 
        
                
end
      fprintf('Folder %s has no txt image files in it.\n', thisFolder);
             
  


   