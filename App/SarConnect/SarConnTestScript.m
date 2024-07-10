%% init &  get top composion

clc;
clear;

ArchModel = autosar.arch.loadModel(bdroot);


[CrntComposition, num, ChildCompCell, CompPathStr] = SarDiveIntoSelectComps(ArchModel, "");


displayCrtLevelInfo(CrntComposition, num, ChildCompCell, CompPathStr);


%% select composition
if num == 0
    % warning("!!  current composition has no child  !!");

else
    [CrntComposition, num, ChildCompCell, CompPathStr] = SarDiveIntoSelectComps(ChildCompCell(1), CompPathStr);
end

displayCrtLevelInfo(CrntComposition, num, ChildCompCell, CompPathStr);


%% back previous Composition
if isempty(CrntComposition.Parent)
    disp(" ");
    warning("!!  can't backward any more  !!");
else
    expression = '/(\w*)/(\w*)$';
    CompPathStr = regexprep(CompPathStr,expression,'');
    [CrntComposition, num, ChildCompCell, CompPathStr] = SarDiveIntoSelectComps(CrntComposition.Parent, CompPathStr);
    
end

displayCrtLevelInfo(CrntComposition, num, ChildCompCell, CompPathStr);


%% test  regexprep

str = "/SarModel4App/Compos_Root/a/b/c/d/dfsfd/gete";

disp(str);
expression = '/(\w*)/(\w*)$';
replace = '/';

newStr = regexprep(str,expression,replace);
disp(newStr);




%% functions

function displayCrtLevelInfo(CrntComposition, num, crtChildCompCell, crtCompPathStr)

disp("==============================================");
CrntComposPathStr = append("Current Level:       ",crtCompPathStr);
disp(CrntComposPathStr);

if isempty(CrntComposition.Parent)
    disp("no parent");
else
    parentStr = append("Parent Composition:  ", CrntComposition.Parent.Name);
    disp(parentStr);
end

disp("- - - - - - - - - - - - - - - - - - - - - - -");
disp("  <Child Composition>  ");
% display Child Compositions
if num == 0
    warning('no composition in current level');
else
    for i = 1: num
        disp(crtChildCompCell(i).Name);
    end
end

disp("----------------------------------------------");
disp(":");
end




