function T = proj2metric_circle(coords, center)
    T = eye(3);
    
    % Lines from the center to the perimeter
    l = [cross(center, coords(:,1)) cross(center, coords(:,2)) cross(center, coords(:,3)) cross(center, coords(:,4)) cross(center, coords(:,5))];

    % Compute the conic
    C = conicfit(coords);

    % Find the tangent lines at each of the coordinates
    m = [C*coords(:,1) C*coords(:,2) C*coords(:,3) C*coords(:,4) C*coords(:,5)];
    
    % Write the conic as a 6-element column vector (a,b,c,d,e,f)
    % c = [C(1,1); 2*C(1,2); C(2,2); 2*C(1,3); 2*C(2,3); C(3,3)];
    
    % Build the 5x6 constraints matrix from each orthogonal line pair l,m
    M = [ l(1,:).*m(1,:);
         (l(1,:).*m(2,:) .+ l(2,:).*m(1,:))/2 ; 
          l(2,:).*m(2,:) ; 
         (l(1,:).*m(3,:) .+ l(3,:).*m(1,:))/2 ; 
         (l(2,:).*m(3,:) .+ l(3,:).*m(2,:))/2 ; 
          l(2,:).*m(2,:)]';
    
    % Compute the degenerate dual conic by finding the null space of Mc
    c = null(M)(:,1);
    Cstarinf = [c(1) c(2)/2 c(4)/2; c(2)/2 c(3) c(5)/2; c(4)/2 c(5)/2 c(6)];
%    [U,S,V] = svd(Cstarinf);
%    T = inv(U);
    [U, lambda] = eig(Cstarinf);
    
    if (lambda(1) < 0 && lambda(2) < 0)
        [U, lambda] = eig(-Cstarinf);
    endif
    U_T = U';
    ss = [sqrt(lambda(1)) 0 0; 0 sqrt(lambda(2)) 0; 0 0 10]
    U_T = ss*U_T
    U = U_T';
    T = inv(U)
endfunction
