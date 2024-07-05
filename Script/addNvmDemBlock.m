%% if model have no NVM and DEM block, add them

NvmBlockHandles = find_system(bdroot,'FindAll','on','SearchDepth',1,'type','block','Name', 'NVRAM Service Component');

if isempty(NvmBlockHandles)
    nvmBlockHandle = add_block('autosarlibnvm/NVRAM Service Component',append(bdroot,"/NVRAM Service Component") ,'MakeNameUnique','on');
end


DemBlockHandles = find_system(bdroot,'FindAll','on','SearchDepth',1,'type','block','Name', 'Diagnostic Service Component');

if isempty(DemBlockHandles)    
    demBlockHandle = add_block('autosarlibdem/Diagnostic Service Component',append(bdroot,"/Diagnostic Service Component") ,'MakeNameUnique','on');
end







