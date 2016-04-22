function mirroredPC = PCMirror(PC, dir)
%TODO: mirrored PC
switch dir
    %Right
    case 1
        %mirrorPC will contain twice as many points as PC:
        origLength = size(PC,1);
        mirroredPC = zeros(2*origLength, 2);
        rightMost = max(PC(:,2))
        for i = 1:origLength;
            mirroredPC(i,1) = PC(i,1);
            mirroredPC(i,2) = PC(i,2);
            mirroredPC(origLength+i,1) = PC(i,1);
            mirroredPC(origLength+i,2) = rightMost+ (rightMost-PC(i,2));
        end
        %Left
    case 2
        mirroredPC = PC;
        %Up
    case 3
        mirroredPC = PC;
        %Down
    case 4
        mirroredPC = PC;
    otherwise
        mirroredPC = PC;
end