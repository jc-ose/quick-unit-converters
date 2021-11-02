function valOut = cvspace(valIn,lenthIn,lenthOut)
% Quickly convert length units
% Usage valOut = cvangle(valIn,angIn,angOut)
arguments
    valIn {mustBeNumeric}
    lenthIn {mustBeText}
    lenthOut {mustBeText}
end
valOut = valIn.*getScaleFactor(lenthIn)./getScaleFactor(lenthOut);
end

function sc = getScaleFactor(len)
% Base unit = meters.
switch lower(len)
    % Metric
    case {'b','byte','bytes'}
        sc = 1;
    case {'kb','kilobyte','kilobytes'}
        sc = 1024;
    case {'mb','megabyte','megabytes'}
        sc = 1048576;
    case {'gb','gigabyte','gigabytes'}
        sc = 1073741824;
    case {'tb','terabyte','terabytes'}
        sc = 1099511627776;
    case {'bi','bit','bits'}
        sc = 8^-1;
    case {'kbi','kilobit','kilobits'}
        sc = 128;
    case {'mbi','megabit','megabits'}
        sc = 131072;
    case {'gbi','gigabit','gigabits'}
        sc = 134217728;
    otherwise
        error('%s is not a supported unit',len)
end
end