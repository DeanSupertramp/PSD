% Riduzione immagine di partenza a 3x64 in scala di grigi
%% Init
clc;
clear all;
close all;

%% Apertura immagine
IMG = imread("immagine.jpg");

%% Resize
IMG_resize = imresize(IMG, [3, 64]);

%% Conversione in Scala di Grigi
IMG_gray = rgb2gray(IMG_resize);

%% Salvataggio immagine
imwrite(IMG_gray, 'immagine OUT.jpg')

imshow(IMG_gray)