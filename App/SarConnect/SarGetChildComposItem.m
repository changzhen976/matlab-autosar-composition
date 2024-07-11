function [tmpItems,tmpItemsData] = SarGetChildComposItem(ChildCompositionNum,ChildCompositionCell)

tmpItems= {};
tmpItemsData = {};

for i = 1:ChildCompositionNum
    tmpItems = [tmpItems, ChildCompositionCell(i).Name];
    % disp(ChildCompositionCell(i).Name);
    tmpItemsData = [tmpItemsData, i];
end

end

