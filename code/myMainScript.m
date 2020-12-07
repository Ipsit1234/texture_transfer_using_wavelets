%%
clc; clear all; close all;
tic;
%% Sky and Pebbles
source = imread('../images/sky.jpg');
texture = imread('../images/pebbles.jpg');
depth = 4;
t = 0.4;
texture_transfer(source, texture, depth, t, 0);
%% Honey bee and Honey Comb
source = imread('../images/honeybee.jpg');
texture = imread('../images/honeycomb.jpg');
depth = 4;
t = 0.4;
texture_transfer(source, texture, depth, t, 0); 
%% White House and Weave
source = imread('../images/white_house.jpg');
texture = imread('../images/weave.jpg');
depth = 4;
t = 0.4;
texture_transfer(source, texture, depth, t, 0);
%% Soil and Cracks
source = imread('../images/soil.jpg');
texture = imread('../images/cracks.jpg');
depth = 4;
t = 0.15;
texture_transfer(source, texture, depth, t, 0);
%% Girl and Rug
source = imread('../images/girl.JPG');
texture = imread('../images/rug.JPG');
depth = 4;
t = 0.4;
texture_transfer(source, texture, depth, t, 0);
%% Times magazine and Crumpled paper
source = imread('../images/times_magazine.jpg');
texture = imread('../images/crumpled.jpg');
depth = 4;
t = 0.4;
texture_transfer(source, texture, depth, t, 0);
%% Depth variation with hue transfer
source = imread('../images/girl.JPG');
texture = imread('../images/rug.JPG');
i1=texture_transfer(source, texture, 0, 0.4, 1);
i2=texture_transfer(source, texture, 1, 0.4, 1);
i3=texture_transfer(source, texture, 2, 0.4, 1);
i4=texture_transfer(source, texture, 5, 0.4, 1);
%% Depth variation without hue transfer
source = imread('../images/sky.jpg');
texture = imread('../images/pebbles.jpg');
i1=texture_transfer(source, texture, 1, 0.4, 0);
i2=texture_transfer(source, texture, 2, 0.4, 0);
i3=texture_transfer(source, texture, 3, 0.4, 0);
i4=texture_transfer(source, texture, 4, 0.4, 0);
i4=texture_transfer(source, texture, 4, 0.4, 0);
%%
toc;