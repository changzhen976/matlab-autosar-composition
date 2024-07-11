%% init &  get top composion

clc;
clear;

ArchModel = autosar.arch.loadModel(bdroot);

[CrntComposition, ChildCompositionNum, ChildCompositionCell, ChildComponentNum, ChildComponetCell, CompPathStr] = SarDiveIntoSelectComps(ArchModel, "");


displayCrtLevelInfo(CrntComposition, ChildCompositionNum, ChildCompositionCell, ChildComponentNum, ChildComponetCell, CompPathStr);


%% select composition
if ChildCompositionNum == 0
    % warning("!!  current composition has no child  !!");
else
    [CrntComposition, ChildCompositionNum, ChildCompositionCell, ChildComponentNum, ChildComponetCell, CompPathStr] = SarDiveIntoSelectComps(ChildCompositionCell(1), CompPathStr);
end

displayCrtLevelInfo(CrntComposition, ChildCompositionNum, ChildCompositionCell, ChildComponentNum, ChildComponetCell, CompPathStr);


%% back previous Composition
if isempty(CrntComposition.Parent)
    % disp(" ");
    % warning("~~~~~can't backward any more~~~~~");
else
    expression = '/(\w*)/(\w*)$';
    CompPathStr = regexprep(CompPathStr,expression,'');
    [CrntComposition, ChildCompositionNum, ChildCompositionCell, ChildComponentNum, ChildComponetCell, CompPathStr] = SarDiveIntoSelectComps(CrntComposition.Parent, CompPathStr);  
end

displayCrtLevelInfo(CrntComposition, ChildCompositionNum, ChildCompositionCell, ChildComponentNum, ChildComponetCell, CompPathStr);


%% test  regexprep

str = "/SarModel4App/Compos_Root/a/b/c/d/dfsfd/gete";

disp(str);
expression = '/(\w*)/(\w*)$';
replace = '/';

newStr = regexprep(str,expression,replace);
disp(newStr);







