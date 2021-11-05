function valOut = cvdigital(valIn,lenthIn,lenthOut)
% Quickly convert digital storage units
% Usage: valOut = cvdigital(valIn,angIn,angOut)
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
    lenthIn char
    lenthOut char
end
valOut = valIn.*getScaleFactor(lenthIn)./getScaleFactor(lenthOut);
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