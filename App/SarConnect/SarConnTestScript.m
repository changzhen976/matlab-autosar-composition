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




%% functions

function displayCrtLevelInfo(CrntComposition, ChildCompositionNum, ChildCompositionCell, ChildComponentNum, ChildComponetCell, crtCompPathStr)

disp("===================================================");
CrntComposPathStr = append("Current Level:       ",crtCompPathStr);
disp(CrntComposPathStr);

if isempty(CrntComposition.Parent)
    warning("no parent");
else
    parentStr = append("Parent Composition:  ", CrntComposition.Parent.Name);
    disp(parentStr);
end

disp("- - - - - - - - <Child Composition> - - - - - - - -");
% disp("  <Child Composition>  ");
% display Child Compositions
if ChildCompositionNum == 0
    warning('no composition in current level');
else
    for i = 1: ChildCompositionNum
        disp(ChildCompositionCell(i).Name);
    end
end
disp("- - - - - - - - <Child Components>- - - - - - - - -");
% disp("  <Child Components>  ");
% display Child Components
if ChildComponentNum == 0
    disp('no Component in current level');
else
    for i = 1: ChildComponentNum
        disp(ChildComponetCell(i).Name);
    end
end

disp("---------------------------------------------------");
disp(":~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:");
end




