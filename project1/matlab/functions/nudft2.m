%{
John Bodenschatz
Marquette University
Rowe Lab
12/07/2022
%}

%{
nudft2.m returns the 2-D nonuniform discrete fourier transform. Assumes
square matrix for image space.

INPUTS:
    x, y (real double): x and y coordinates (vectorized) of image space
    kx, ky (real double): x and y coordinates (vectorized) of k-space
    F (complex double): image space matrix correspinding to x and y inputs
OUTPUT:
    Y (complex double): fourier transform of F onto kx and ky
%}

function nudft2 = nudft2(x,y,kx,ky,F)
    i = sqrt(-1);
    Nx = length(x);
    nudft2 = zeros(Nx,1);
    F = F(:);
    for j=1:Nx
        nudft2(j) = sum(F .* exp(-(2*pi*i)*(kx(j)*x + ky(j)*y)));
    end
end

% this could probably be optimized a little better :)