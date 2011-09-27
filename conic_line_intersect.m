function p = conic_line_intersect(C, m1, m2)
    % Solve the quadratic equation
    % x^2 (m_2^T C m_2) + 2x (m_2^T C m_1) + (m_1^T C m_1) = 0 
    x = roots([m2' * C * m2,  2*m2' * C * m1,  m1' * C * m1]);
    
    % Calculate the points m_1 + x_1 m_2 and m_1 + x_2 m_2
    p = repmat(m1, [1 length(x)]) + m2*x';
    p ./= repmat(p(3,:), [3 1]);
endfunction
