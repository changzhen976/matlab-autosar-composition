% add component or aomposition port
% input parameters: 
%               selectCompCell  Cell Array  -   component and composition
%                                               needed add
%               SendReceive     String      -   'Sender' or 'Receiver'
%               PortName        String      -   port name

function SarAddPort(selectCompCell,SendReceive, PortName)

for i = 1:length(selectCompCell)
    % disp('');
    % disp(selectCompCell(i));
    addCompPort(selectCompCell(i),SendReceive, PortName);
end
    

end

%% add port cmd

% addCompPort(comp1,'Receiver','ThrCmd_Int');


%% functions

function addCompPort(comp,SendReceive, PortName)

try
    addPort(comp, SendReceive, PortName);
catch errMsg
    msgbox('port is already exist.',"Fail","error");
    warning(errMsg);
end

end






