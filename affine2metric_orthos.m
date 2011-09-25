function T = affine2metric_orthos(l1, m1, l2, m2)
    T = eye(3);
    
    % Refer to Hartley and Zisserman, Multiple View Geometry, 2nd Ed. (pp 55-56)
    % Find S = K K-transpose
    
    % Set up the constraints from the orthogonal line pairs
    ortho_constraints = [l1(1)*m1(1), l1(1)*m1(2)+l1(2)*m1(1), l1(2)*m1(2)
                         l2(1)*m2(1), l2(1)*m2(2)+l2(2)*m2(1), l2(2)*m2(2)];
    
    % Find s and S from the null space of the constraints matrix
    s = null(ortho_constraints);
    S = [s(1) s(2); s(2) s(3)]

    % Produces "error: chol: matrix not positive definite" on some cases
    % Get K from the Cholesky decomposition of S
    %K = chol(S);

    % Recover K using SVD of S    
    [u, sigma, v] = svd(S)
    K = u*sqrt(sigma)*u'
    T(1:2,1:2) = K;
    T = inv(T);
endfunction
