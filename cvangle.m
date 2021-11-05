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
%     ur, microrad, microradian
%     nr, nanorad, nanoradians

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
    case {'r','rad','radian','radians'}
        sc = 1;
    case {'d','deg','degree','degrees'}
        sc = pi./180;
    case {'min','amin','arcmin','arcminute','arcminutes'}
        sc = pi./10800;
    case {'sec','asec','arcsec','arcsecond','arcseconds'}
        sc = pi./648000;
    case {'mr','mrad','millirad','milliradian','milliradians'}
        sc = 1e-3;
    case {'ur','urad','microrad','microradian','microradians'}
        sc = 1e-6;
    case {'nr','nrad','nanorad','nanoradian','nanoradians'}
        sc = 1e-6;
    otherwise
        error('%s is not a supported unit',ang)
end
end