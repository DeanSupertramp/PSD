%% Init
clc;
clear all;
close all;

ncol = 64;
nrig = 3;
mat = [];
k = 0;

%% Loop
for i=1:nrig
    for j=1:ncol
        mat{i,j}=k;
        k=k+1;
    end 
end
        