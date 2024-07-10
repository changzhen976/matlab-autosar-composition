

function [CrtComposition, num, ChildCompCell, CompPathStr] = SarDiveIntoSelectComps(SelectedCompositon, ParentPath)


CrtComposition = SelectedCompositon;

CompPathStr = append(ParentPath,"/",SelectedCompositon.Name);

ChildCompCell = {};

if isempty(SelectedCompositon.Compositions)
    num = 0;
   
else

    num = length(SelectedCompositon.Compositions);
    
    for i = 1:num
        % disp(CrntCompositon.Compositions(i).Name);
        ChildCompCell = [ChildCompCell;  SelectedCompositon.Compositions(i)];
    end

end






end
