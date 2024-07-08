





%% load Arch Model

% modelName = 'testModel4Script';
archModel = autosar.arch.loadModel(gcs);

%% find composion & component

comp1 = archModel.Components;
comp2 = archModel.Compositions;

addPort(comp1,'Receiver','ThrCmd_Int');
addPort(comp2,'Sender','ThrCmd_Int');


%% connect

% connect(archModel,<comp with outport>,<comp with inport>);
connectors = connect(archModel,comp2,comp1);








