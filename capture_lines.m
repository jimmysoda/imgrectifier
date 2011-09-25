function l = capture_lines(n, format = "-@gx")
    l = [];
    x = [];
    y = [];
    coords = [];
    
    for k = 1:n+1
        [i,j] = ginput(1);
        plot(i, j, format);
        p = [i j 1]';
        
        if (k > 1)
            plot([x(k-1) i], [y(k-1) j], format);
            l = [l cross(coords(:,k-1), p)];
        endif
        
        x = [x; i];
        y = [y; j];
        coords = [coords p];
    endfor

    l ./= repmat(l(3,:), [3 1]);
endfunction
