%% delete Nvm and DEM blocks

NvmBlockHandles = find_system(bdroot,'FindAll','on','SearchDepth',1,'type','block','Name', 'NVRAM Service Component');

if ~isempty(NvmBlockHandles)
    delete_block(NvmBlockHandles);
end


DemBlockHandles = find_system(bdroot,'FindAll','on','SearchDepth',1,'type','block','Name', 'Diagnostic Service Component');

if ~isempty(DemBlockHandles)
    delete_block(DemBlockHandles);
end