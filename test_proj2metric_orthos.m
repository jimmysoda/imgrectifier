function test_proj2metric_orthos(filename)
    timestamp = strftime("%Y%m%d-%H%M", localtime(time()));
    funcname = mfilename();
    prefix = sprintf("%s_%s_%s", filename, funcname, timestamp);
    
    I = imread(filename);
    img = I;
        
    if (isrgb(img))
        img = rgb2gray(img);
    endif

    fullscreen = get(0,'ScreenSize');
    fig = figure('Position',[0 -50 fullscreen(3) fullscreen(4)]);
    clf;
    
    imshow(img);
    hold on;
    title("Plot 5 non-parallel orthogonal line pairs");
    [l,m] = capture_orthos(5)
    title("Original Image"); 
    print(fig, "-dpng", sprintf("%s_original.png", prefix));
    close(fig);

    T = proj2metric_orthos(l,m);    
    I_T = imperspectivewarp(I, T, "bilinear", "loose");
        
    fig = figure('Position',[0 -50 fullscreen(3) fullscreen(4)]);
    imshow(rgb2gray(I_T));
    hold on;
    title("Rectified Image");    
    coords = T*coords;
    plot_vanishing_line([coords coords(:,1)]);
    print(fig, "-dpng", sprintf("%s_rectified.png", prefix));
    close(fig);
    imwrite(I_T, sprintf("%s_.png", prefix));
endfunction
