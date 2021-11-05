function valOut = cvarea(valIn,lenthIn,lenthOut)
% Quickly convert area units
% Usage: valOut = cvarea(valIn,angIn,angOut)
%
% --- Options ---
% -- Metric -
%     sqm,  squaremeter
%     sqcm, squarecentimeter
%     sqmm, squaremillimeter
%     squm, squaremicrometer, squaremicron
%     sqnm, squarenanometer
%     sqkm, squarekilometer
% -- Imperial -
%     sqin, squareinch
%     sqft, squarefoot
%     sqyd, squareyard
%     sqmi, squaremile
% -- Other - 
%     acre
%     are
%     hectare
%     barn

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
    case {'sqm','squaremeter'}
        sc = 1;
    case {'sqcm','squarecentimeter'}
        sc = 1e-4;
    case {'sqmm','squaremillimeter'}
        sc = 1e-6;
    case {'squm','squaremicrometer','squaremicron'}
        sc = 1e-12;
    case {'sqnm','squarenanometer'}    
        sc = 1e-18;
    case {'sqkm','squarekilometer'}
        sc = 1e6;
    % Imperial
    case {'sqin','squareinch'}
        sc = 0.00064516;
    case {'sqft','squarefoot'}
        sc = 0.09290304;
    case {'sqyd','squareyard'}
        sc = 0.83612736;
    case {'sqmi','squaremile'}
        sc = 2589988.110336;
    % Other
    case 'acre'
        sc = 4046.8564224;
    case 'hectare'
        sc = 10000;
    case 'are'
        sc = 100;
    case 'barn'
        sc = 1e-28;
    otherwise
        error('%s is not a supported unit',len)
end
end