%{
John Bodenschatz
Marquette University
Rowe Lab
10/12/2022
%}

%{
simplespokes.m returns a set of n "spokes filter" matrices that skip
angular lines in polar k-space

INPUTS:
    ny (int): number of rows in image
    nx (int): number of columns in image
    nspokes (int): number of spokes on the bike wheel
OUTPUT:
    spokes (ny × nx × nmasks double): sparse matrix with ones in the
    columns where spokes are "kept"
%}

function simplespokes = simplespokes(ny,nx,nspokes)
    niter=floor(nx/nspokes);
    simplespokes = zeros(ny,nx,niter);
    for j=1:niter
        for k=1:nspokes
            simplespokes(:,j+(k-1)*niter,j) = ones(ny,1);
        end
    end
end

% this could probably be optimized a little better :)