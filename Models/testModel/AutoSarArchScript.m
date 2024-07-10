





%% load Arch Model

% modelName = 'testModel4Script';
archModel = autosar.arch.loadModel(gcs);

%% find composion & component
ComponentsCell = {};
CompositionsCell = {};

if isempty(archModel.Components)

else
    for i = 1:length(archModel.Components)
        ComponentsCell = [ComponentsCell, archModel.Components(i)];
    end
end

if isempty(archModel.Compositions)

else
    for i = 1:length(archModel.Compositions)
        CompositionsCell = [CompositionsCell, archModel.Compositions(i)];
    end
end


comp1 = ComponentsCell(1);
comp2 = CompositionsCell(1);

%% add port

addCompPort(comp1,'Receiver','ThrCmd_Int');
addCompPort(comp1,'Receiver','ThrCmd_Int2');
addCompPort(comp2,'Sender','ThrCmd_Int');
addCompPort(comp2,'Sender','ThrCmd_Int2');



%% connect

% connect(archModel,<comp with outport>,<comp with inport>);
connectors = connect(archModel,comp2,comp1);

%% functions

function addCompPort(comp,SendReceive, PortName)

try
    addPort(comp, SendReceive, PortName);
catch errMsg
    warning(errMsg.message);
end

end






