% export AUTOSAR Architecture ArXML and Code
% set arch model name.
% need project opened.


ArchitecturelName = 'AutosarStructrueTemplete';

%% check and load project
proj = matlab.project.rootProject;

if isempty(proj)
    error("open project, please.");
end


% get Archtecture Model
archModel = autosar.arch.loadModel(ArchitecturelName);


%% cofigure and export

% set Export Path
exportPath = append(proj.ProjectStartupFolder,'\release');
%disp(exportPath);

% name exported zip file, add timestamp
t = datetime('now','Format','yyyy_MM_dd_HH_mm');
dateString = string(t);
zipCodeFileName = append("Code_",dateString,".zip");

% export
disp("Begin building...");
export(archModel, 'ExportedARXMLFolder',exportPath,'PackageCodeAndARXML', zipCodeFileName);


%% move zip to release folder
status = movefile(zipCodeFileName, exportPath);
if status == 1
    disp('Export OK!');
else
    disp("Something WRONG...");
end



