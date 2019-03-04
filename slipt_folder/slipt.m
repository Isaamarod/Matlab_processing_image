%split folder
Folder='C:\Users\cober\Desktop\1512427\all_matlab';
Dest     = 'C:\Users\cober\Desktop\FASE_6\test';
FileList = dir(fullfile(Folder, '*.mat'));
numberOfFolders = length(FileList);
index    = randperm(numel(FileList), 613);
for k = 1:numberOfFolders
  Source = fullfile(Folder, FileList(index(k)).name);
  copyfile(Source, Dest);
end