clc;
clear all;
close all;
%%%%%%%%%%%%%%%%    add noise   %%%%%%%%%%%%%%%%

load xsim;
xx=xsim;
[m n z]=size(xx);

for i =1: z
    img(:,:)=xx(:,:,i);
    img=imnoise(img,'gaussian',0,.7);
    xsim7(:,:,i)=img;
end
save('xsim7','xsim7');

