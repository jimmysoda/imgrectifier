function T = proj2metric_square(coords)
    % Get the affine rectification transformation and apply it to the input coords
    H_P = proj2affine(coords); 
    affine_coords = H_P * coords;
    
    % Create two non-parallel pairs of orthogonal lines
    % One pair on a corner of the square: l(:,1) and l(:,2)
    % One pair from the diagonal and transversal of the square: l(:,3) and l(:,4)
    l = [cross(affine_coords(:,1), affine_coords(:,2))'
         cross(affine_coords(:,2), affine_coords(:,3))'
         cross(affine_coords(:,1), affine_coords(:,3))'
         cross(affine_coords(:,2), affine_coords(:,4))']';
    
    % Normalize the lines
    l ./= repmat(l(3,:), [3 1]);
    
    % Get the affine-to-metric rectification from the ortho pairs 
    H_A = affine2metric_orthos(l(:,1), l(:,2), l(:,3), l(:,4));
    
    % Return the product of the rectification matrices
    T = H_P*H_A;
endfunction
