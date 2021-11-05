function valOut = cvlength(valIn,lenthIn,lenthOut)
% Quickly convert length units
% Usage: valOut = cvlength(valIn,angIn,angOut)
%
% --- Options ---
% -- Metric -
%     m,  meter
%     cm, centimeter
%     mm, millimeter
%     um, micrometer, micron
%     pm, picometer
%     fm, femtometer
%     km, kilometer
%     a, angstrom
% -- Imperial -
%     in, inch
%     ft, foot
%     yd, yard
%     mi, mile
%     mil (thousandths of an inch)
% -- Other - 
%     au, astrounit (astronomical units)
%     nmi (nautical miles)
%     ly, lightyear
%     pcs, parsec

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
    case {'m','meter','meters'}
        sc = 1;
    case {'cm','centimeter','centimeters'}
        sc = 1e-2;
    case {'mm','millimeter','millimeters'}
        sc = 1e-3;
    case {'um','micrometer','micrometers','micron','microns'}
        sc = 1e-6;
    case {'nm','nanometer','nanometers'}    
        sc = 1e-9;
    case {'pm','picometer','picometers'}
        sc = 1e-12;
    case {'fm','femtometer','femtometers'}    
        sc = 1e-16;
    case {'km','kilometer','kilometers'}
        sc = 1e3;
    case {'a','angstrom','angstroms'}
        sc = 1e10;
    % Imperial
    case {'in','inch','inches'}
        sc = 2.54e-2;
    case {'ft','foot','feet'}
        sc = 2.54e-2*12;
    case {'yd','yard','yards'}
        sc = 2.54e-2*36;
    case {'mi','mile','miles'}
        sc = 2.54e-2*63360;
    case {'mil','mils'}
        sc = 2.54e-5;
    % Other
    case {'au','astrounit'}
        sc = 149597870700;
    case 'nmi' %nautical miles
        sc = 1852;
    case {'ly','lightyear','lightyears'}
        sc = 9.4607e15;
    case {'pcs','parsec','parsecs'}
        sc = 3.0857e16;
    otherwise
        if contains(len,'wv') % support for waves (examples wv1.0um | wv632.8nm | wv0.55microns)
            lenVal = str2double(regexprep(len,'[^\d.]+',''));
            lenUnits = regexprep(len,'wv[\d.]+','');
            sc = cvlength(lenVal,lenUnits,'m');
        else
            error('%s is not a supported unit',len)
        end
end
end