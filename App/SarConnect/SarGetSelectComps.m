function selectComps = SarGetSelectComps(matchedName, ChildCompositionNum, ChildCompositionCell, ChildComponentNum, ChildComponetCell)

% matchedName = [{'Compos_Root_03'} {'Compon_Root'}];

selectComposition = {};
selectComponent = {};

for i = 1:ChildCompositionNum
    if ismember(ChildCompositionCell(i).Name, matchedName)
        selectComposition = [selectComposition, ChildCompositionCell(i)];
    end
end

for i = 1:ChildComponentNum
    if ismember(ChildComponetCell(i).Name, matchedName)
        selectComponent = [selectComponent, ChildComponetCell(i)];
    end
end

selectComps = [selectComposition, selectComponent];

end

