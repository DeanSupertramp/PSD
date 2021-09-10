clc;
clear all;
close all;

%% IMMAGINE
filename = 'unical2.png';
img = imread(filename);

%% RESIZE
img = imresize((img),[3 64]);
[ M,N,P ] = size(img);

%% CONVERSIONE IN SCALA DI GRIGI
if P == 3
    img = rgb2gray(img);
end

file = fopen('file_COE.coe','wt');
fprintf(file,'%s\n','memory_initialization_radix=10;'); 
fprintf(file,'%s\n','memory_initialization_vector=');

%% GENERAZIONE COE
for i=1:M
    for j=1:N
        fprintf(file, '%d', img(i,j));
        if(i==M && j==N)
            fprintf(file,'%c',';');
        else
            fprintf(file,'%c\n',',');
        end
    end
end

imshow(img)

fclose(file);