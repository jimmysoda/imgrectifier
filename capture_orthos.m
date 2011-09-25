function [l,m] = capture_orthos(n)
    l = [];
    m = [];
    
    for k=1:n
        mode = mod(k,6);
        lines = capture_lines(2, sprintf("-@%d%d"), mode, mode);
        l = [l lines(:,1)];
        m = [m lines(:,2)];      
    endfor
endfunction
