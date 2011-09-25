function coords = capture_points(n, format = "@gx")
    x = [];
    y = [];
    for i = 1:n
        [i,j] = ginput(1);
        plot(i, j, format);
        x = [x; i];
        y = [y; j];
    endfor
    coords = [x'; y'; ones(1, numel(x))];
endfunction
