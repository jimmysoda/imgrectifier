function coords = capture_quad(format = "-g")
    x = [];
    y = [];
    for k = 1:4
        [i,j] = ginput(1);
        plot(i, j, "@gx");

        if (k > 1)
            plot([x(k-1) i], [y(k-1) j], format);
        endif
        
        x = [x; i];
        y = [y; j];
    endfor
    plot([x(4) x(1)], [y(4), y(1)], format);
    coords = [x'; y'; ones(1, numel(x))];
endfunction
