function test_proj2metric_circle(filename)
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
    title("Click 5 points that exist on a real-world circle:");
    coords = capture_points(5);    
    title("Click the center of the real-world circle:");
    center = capture_points(1);
    title("Original Image");
    print(fig, "-dpng", sprintf("%s_original.png", prefix));
    close(fig);

    T = proj2metric_circle(coords, center);
    I_T = imperspectivewarp(I, T, "bilinear", "loose");
    
    fig = figure('Position',[0 -50 fullscreen(3) fullscreen(4)]);
    imshow(rgb2gray(I_T));
    hold on;
    title("Rectified Image");    
    print(fig, "-dpng", sprintf("%s_rectified.png", prefix));
    close(fig);
    imwrite(I_T, sprintf("%s.png", prefix));
endfunction
