function valOut = cvdigital(valIn,unitIn,unitOut)
% Quickly convert digital storage units
% Usage: valOut = cvdigital(valIn,unitIn,unitOut)
%
% --- Options ---
%     b, byte
%     kb, kilobyte
%     mb, megabyte
%     tb, terabyte
%     bi, bit
%     kbi, kilobit
%     mbi, megabit
%     gbi, gigabit

arguments
    valIn {mustBeNumeric}
    unitIn char
    unitOut char
end
if strcmpi(unitIn,unitOut)
    valOut = valIn;
    return;
end
valOut = valIn.*getScaleFactor(unitIn)./getScaleFactor(unitOut);
end

function sc = getScaleFactor(len)
% Base unit = meters.
switch lower(len)
    % Metric
    case {'b','byte'}
        sc = 1;
    case {'kb','kilobyte'}
        sc = 1024;
    case {'mb','megabyte'}
        sc = 1048576;
    case {'gb','gigabyte'}
        sc = 1073741824;
    case {'tb','terabyte'}
        sc = 1099511627776;
    case {'bi','bit'}
        sc = 8^-1;
    case {'kbi','kilobit'}
        sc = 128;
    case {'mbi','megabit'}
        sc = 131072;
    case {'gbi','gigabit'}
        sc = 134217728;
    otherwise
        error('%s is not a supported unit',len)
end
end