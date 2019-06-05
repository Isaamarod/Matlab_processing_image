%split folder
Folder='C:\Users\cober\Desktop\FASE_6\FASE_6_matlab\split-CV\CV_3\train';
Dest = 'C:\Users\cober\Desktop\FASE_6\FASE_6_matlab\split-CV\CV_3\test';
FileList = dir(fullfile(Folder, '*.mat'));
numberOfFolders = length(FileList);
index = randperm(numel(FileList), 613);

for k=1:numberOfFolders
  Source = fullfile(Folder, FileList(index(k)).name);
  movefile(Source, Dest);
end