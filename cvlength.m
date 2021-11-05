function valOut = cvlength(valIn,unitIn,unitOut)
% Quickly convert length units
% Usage: valOut = cvlength(valIn,unitIn,unitOut)
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
    case {'m','meter'}
        sc = 1;
    case {'cm','centimeter'}
        sc = 1e-2;
    case {'mm','millimeter'}
        sc = 1e-3;
    case {'um','micrometer','micron'}
        sc = 1e-6;
    case {'nm','nanometer'}    
        sc = 1e-9;
    case {'pm','picometer'}
        sc = 1e-12;
    case {'fm','femtometer'}    
        sc = 1e-16;
    case {'km','kilometer'}
        sc = 1e3;
    case {'a','angstrom'}
        sc = 1e10;
    % Imperial
    case {'in','inch'}
        sc = 2.54e-2;
    case {'ft','foot','feet'}
        sc = 0.3048;
    case {'yd','yard'}
        sc = 0.9144;
    case {'mi','mile'}
        sc = 1609.344;
    case 'mil'
        sc = 2.54e-5;
    % Other
    case {'au','astrounit'}
        sc = 149597870700;
    case 'nmi' %nautical miles
        sc = 1852;
    case {'ly','lightyear'}
        sc = 9.4607e15;
    case {'pcs','parsec'}
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