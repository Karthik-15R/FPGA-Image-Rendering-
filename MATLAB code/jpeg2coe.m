% Load and process image
img = imread('image.jpg');         % Load image
gray_img = rgb2gray(imresize(img, [120 160]));  % Resize to 160x120 and convert to grayscale

% Open COE file
fileID = fopen('fimage.coe','w');

% Write header
fprintf(fileID, 'memory_initialization_radix=16;\n');
fprintf(fileID, 'memory_initialization_vector=\n');

% Write pixel values
[height, width] = size(gray_img);
for y = 1:height
    for x = 1:width
        pixel = gray_img(y,x);
        fprintf(fileID, '%02X', pixel);  % Write in 2-digit hex
        if ~(y == height && x == width)
            fprintf(fileID, ',\n');
        else
            fprintf(fileID, ';\n');
        end
    end
end

fclose(fileID);
disp('COE file generated as image.coe');
