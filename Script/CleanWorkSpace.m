%{

  Delete name-end-matched folder&files 
  in current folder (and sub-folder)

%}

FolderPat = ["_autosar_rtw", "slprj"];
FilePat = [".slxc", ".autosave"];

clearSubFolder(pwd, FolderPat, FilePat);


%% delete matched folders & files
function clearSubFolder(OpDirPath, subFolderPat, subFilePat)


    dirStructure = dir(OpDirPath);
    
    [num, folderCell] = CleanAndGetSubFolders(dirStructure, subFolderPat,subFilePat);
    if num > 0      % recursive call self on each subFolder
        for i = 1: num
            tmpPath = folderCell{i};
            clearSubFolder(tmpPath, subFolderPat, subFilePat);  
        end
    end

end


%% Return dirDtructure's sub folder number and path(return as cell)
function [num, folderCell] = CleanAndGetSubFolders(dirStructure, subFolderPat,subFilePat)

    num = 0;
    folderCell = {};
    tmpLength = length(dirStructure);
    if tmpLength > 2
        
        for i = 3 : tmpLength
            if dirStructure(i).isdir == 1
                subFolderName = append(dirStructure(i).folder,'\',dirStructure(i).name);
                if ~endsWith(subFolderName, subFolderPat) % _autosar_rtw
                    num = num + 1;
                    % disp(subFolderName);
                    folderCell = [folderCell; subFolderName];
                else
                    disp(subFolderName);
                    [status, message, messageid] = rmdir(subFolderName, 's');
                    if status == 0
                        disp("delete fail, please manually delete blow folder.");
                        warning(messageid);
                        warning(message);
                    end
                    disp("delete this folder.");
                end
            else
                subFileName = append(dirStructure(i).folder,'\',dirStructure(i).name);
                
                if  endsWith(subFileName, subFilePat) 
                    delete(subFileName);
                    disp(subFileName);
                    disp("delete this file.");
                    % delete this file
                end
            end
        end

    end

end



