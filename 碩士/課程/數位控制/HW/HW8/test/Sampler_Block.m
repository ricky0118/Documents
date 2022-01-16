function Sampler_Block(block)
    setup(block);

end

function  setup(block)
    % Setup number of block parameters
    block.NumDialogPrms = 2;

    % Setup number of block I/O ports
    block.NumInputPorts = 2;
    block.NumOutputPorts = 1;
    
    block.SetPreCompInpPortInfoToDynamic;
    block.SetPreCompOutPortInfoToDynamic;

%     block.SampleTimes = [0.01 0];
%     block.SimStateCompliance = 'DefaultSimState';

    % Setup methods function
    block.RegBlockMethod('PostPropagationSetup', @DoPostPropSetup);
    block.RegBlockMethod('InitializeConditions', @InitConditions);
    block.RegBlockMethod('Outputs', @Output);
    block.RegBlockMethod('Update', @Update);
end

%%
function DoPostPropSetup(block)
    % Setup block memory
    block.NumDworks = 4;
    block.Dwork(1).Name = 'SampleTime';
    block.Dwork(1).Dimensions = 1;
    block.Dwork(1).DatatypeID = 0;
    block.Dwork(1).Complexity = 'Real';
    block.Dwork(1).UsedAsDiscState = true;

    block.Dwork(2).Name = 'ShiftTime';
    block.Dwork(2).Dimensions = 1;
    block.Dwork(2).DatatypeID = 0;
    block.Dwork(2).Complexity = 'Real';
    block.Dwork(2).UsedAsDiscState = true;
    
    block.Dwork(3).Name = 'Time';
    block.Dwork(3).Dimensions = 1;
    block.Dwork(3).DatatypeID = 0;
    block.Dwork(3).Complexity = 'Real';
    block.Dwork(3).UsedAsDiscState = true;
    
    block.Dwork(4).Name = 'Data';
    block.Dwork(4).Dimensions = 1;
    block.Dwork(4).DatatypeID = 0;
    block.Dwork(4).Complexity = 'Real';
    block.Dwork(4).UsedAsDiscState = true;

end

%%
function InitConditions(block)
    % Get the block parameters
    block.Dwork(1).Data = block.DialogPrm(1).Data;
    block.Dwork(2).Data = block.DialogPrm(2).Data;
  
end

%%
function Output(block)
    % Data Output function
    % function of sampler
    T = block.Dwork(1).Data;
    shift = block.Dwork(2).Data;
    t = block.Dwork(3).Data;
    u = block.Dwork(4).Data;
    
    if rem(t-shift, T)==0
        block.OutputPort(1).Data = u;
    else
        block.OutputPort(1).Data = 0;
    end
  
end

%%
function Update(block)
    % Update the input data to block memory
    block.Dwork(3).Data = block.InputPort(1).Data;
    block.Dwork(4).Data = block.InputPort(2).Data;
  
end

