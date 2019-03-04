%generate_imgs('C:\Users\cober\Desktop\1512427','C:\Users\cober\Desktop\1512427\all_jpg')
function generate_imgs( pathname, output_path )
    addpath('..\export_fig-master');
    % Get list of all subfolders.
    allSubFolders = genpath(pathname);
    fprintf(allSubFolders);
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
                img=storedStructure.cjdata.image;
                img= imshow(img,[]);
                name=strrep(baseFileNames(f).name,'.mat','');
                full_o=fullfile(output_path,name);
                export_fig(full_o);            
            end
        else
            fprintf('Folder %s has no image files in it.\n', thisFolder);
        end
    end

end

