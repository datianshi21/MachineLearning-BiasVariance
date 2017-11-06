function ybar=computeybar(xTe)
% function [ybar]=ybar(xTe);
% 
% computes the expected label 'ybar' for a set of inputs x
% generated from two standard Normal distributions (one offset by OFFSET in
% both dimensions.)
%
% INPUT:
% xTe | a 2xn matrix of column input vectors
% 
% OUTPUT:
% ybar | a 1xn vector of the expected label ybare(x)
%

global OFFSET;

[~,n]=size(xTe);
ybar=zeros(1,n);

% Feel free to use the following function to compute p(x|y)
P_x_y1 = normpdf(xTe , 0 , 1);
P_x_y1 = P_x_y1(1,:) .* P_x_y1(2,:);
P_x_y2 = normpdf(xTe , OFFSET , 1);
P_x_y2 = P_x_y2(1,:) .* P_x_y2(2,:);
P_x = (P_x_y1 .* ((n - ceil(n/2))/n)) + (P_x_y2 .* (ceil(n/2)/n));
P_y1_x = P_x_y1 .* ((n - ceil(n/2))/n) ./ P_x;
P_y2_x = P_x_y2 .* (ceil(n/2)/n) ./ P_x;
ybar = P_y1_x + 2 .* P_y2_x;

