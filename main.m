clc;
clear all;
close all;

%read images
load 'images/xsim';
y = double(xsim);

% mean(A,dim): returns the mean along dimension dim
% If A is a matrix, mean(A,2) is a column vector containing the mean of each row
g = mean(y,3);
%figure, mesh(g);

%compute focus volume
M = SML(y);

%compute depth maps
D = computeDepthCloud(M);
[coeff,score,latent,tsquared] = pca(D);

%%% initial depth Dt(data term)
Dt = score(:,1);


%Apply optimization on Dt
sigma_s = 10;
sigma_r = 0.7;
iteration = 10;
GaussianPrecision = 0.5;

result = RollingGuidanceFilter(Dt, sigma_s, sigma_r, iteration, GaussianPrecision);

d = reshape(Dt,360,360);
resultD = reshape(result, 360, 360);

figure, mesh(d);
figure, mesh(resultD);
