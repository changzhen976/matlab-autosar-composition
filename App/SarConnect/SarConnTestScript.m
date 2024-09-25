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

%% get component with comp name

% ChildCompositionCell
% ChildComponetCell

% matchedName = {'Compos_Root_03', 'Compon_Root'};

matchedName = [{'Compos_Root_03'} {'Compon_Root'}];

selectComposition = {};
selectComponent = {};

for i = 1:ChildCompositionNum
    if ismember(ChildCompositionCell(i).Name, matchedName)
        SelectCompsIndex(i) = 1;
        selectComposition = [selectComposition, ChildCompositionCell(i)];
    end
end

for i = 1:ChildComponentNum
    if ismember(ChildComponetCell(i).Name, matchedName)
        SelectCompnIndex(i) = 1;
        selectComponent = [selectComponent, ChildComponetCell(i)];
    end
end

% selectComposition = ChildCompositionCell(SelectCompsIndex)
% selectComponent = ChildComponetCell(SelectCompnIndex)
selectComps = [selectComposition, selectComponent];



%% add port

% outPort1 = addPort(newComponents(1).Architecture,"testSig","out");

addPort(ChildCompositionCell(1), 'Sender', 'testPortSender');


%% ismember

a = 'a';
b = ['a', 'b'];

c = b(ismember(b, a));

