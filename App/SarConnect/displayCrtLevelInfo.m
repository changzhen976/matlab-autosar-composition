%% functions

function displayCrtLevelInfo(CrntComposition, ChildCompositionNum, ChildCompositionCell, ChildComponentNum, ChildComponetCell, crtCompPathStr)

disp("===================================================");
CrntComposPathStr = append("Current Level:       ",crtCompPathStr);
disp(CrntComposPathStr);

if isempty(CrntComposition.Parent)
    disp("no parent");
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



