%{
John Bodenschatz
Marquette University
Rowe Lab
10/12/2022
%}

%{
spokes.m returns a "spokes filter" matrix that can be used to simulate
measuring spokes of a cartesian image.

INPUTS:
    ny (int): number of rows in image
    nx (int): number of columns in image
    nspokes (int): number of spokes on the bike wheel
    theta (float): angle (rad) to initiate first spoke at (default=0)
OUTPUT:
    spokes (ny × nx double): sparse matrix with ones along the lines formed
    by the spokes
%}

function spokes = spokes(ny,nx,nspokes,theta)
    if ~exist('theta','var')
        theta=0;
    end
    
    r = floor(ny/2);
    delta = pi/nspokes;
    coords = cell(nspokes,1);
    for j=1:nspokes
        coords{j,1} = r.*[cos(theta) sin(theta); -cos(theta) -sin(theta)]+r;
        theta = theta + delta;
    end
    
    spokes = ones(ny,nx);
    figure('visible','off');
    imagesc(spokes)
    for k = 1:nspokes
        c = coords{k,1};
        hLine = drawline('Position',c);
        binaryImage = createMask(hLine);
        spokes = spokes .* (1 - binaryImage);
    end
    spokes = 1-spokes;
end