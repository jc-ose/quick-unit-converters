function valOut = cvangle(valIn,angIn,angOut)
% Quickly convert angle units
% Usage: valOut = cvangle(valIn,angIn,angOut)
%
% --- Options ---
%     r, rad, radian
%     d, deg, degree
%     min, arcmin
%     sec, arcsec
%     mr, mrad, milliradian
%     ur, urad, microrad, microradian
%     nr, nrad, nanorad, nanoradians

arguments
    valIn {mustBeNumeric}
    angIn char
    angOut char
end
valOut = valIn.*getScaleFactor(angIn)./getScaleFactor(angOut);
end

function sc = getScaleFactor(ang)
% Base unit = radians. Convert angIn to rad then to angOut.
switch lower(ang)
    case {'r','rad','radian'}
        sc = 1;
    case {'d','deg','degree'}
        sc = pi./180;
    case {'min','amin','arcmin','arcminute'}
        sc = pi./10800;
    case {'sec','asec','arcsec','arcsecond'}
        sc = pi./648000;
    case {'mr','mrad','millirad','milliradian'}
        sc = 1e-3;
    case {'ur','urad','microrad','microradian'}
        sc = 1e-6;
    case {'nr','nrad','nanorad','nanoradian'}
        sc = 1e-6;
    otherwise
        error('%s is not a supported unit',ang)
end
end