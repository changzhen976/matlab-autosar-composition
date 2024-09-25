function [tmpItems,tmpItemsData] = SarGetChildComponItem(ChildComponentNum,ChildComponentCell)

tmpItems= {};
tmpItemsData = {};

for i = 1:ChildComponentNum
    tmpItems = [tmpItems, ChildComponentCell(i).Name];
    % disp(ChildCompositionCell(i).Name);
    tmpItemsData = [tmpItemsData; i];
end

end

