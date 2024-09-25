

function [CrntComposition, ChildCompositionNum, ChildCompositionCell, ChildComponentNum, ChildComponetCell, CompPathStr] = SarDiveIntoSelectComps(SelectedCompositon, ParentPath)


CrntComposition = SelectedCompositon;

CompPathStr = append(ParentPath,"/",SelectedCompositon.Name);

ChildCompositionCell = {};
ChildComponetCell = {};


if isempty(SelectedCompositon.Compositions)
    ChildCompositionNum = 0;  
else
    ChildCompositionNum = length(SelectedCompositon.Compositions);
    
    for i = 1:ChildCompositionNum
        % disp(CrntCompositon.Compositions(i).Name);
        ChildCompositionCell = [ChildCompositionCell;  SelectedCompositon.Compositions(i)];
    end
end

if isempty(SelectedCompositon.Components)
    ChildComponentNum = 0;  
else
    ChildComponentNum = length(SelectedCompositon.Components);
    
    for i = 1:ChildComponentNum
        % disp(CrntCompositon.Compositions(i).Name);
        ChildComponetCell = [ChildComponetCell;  SelectedCompositon.Components(i)];
    end
end





end
