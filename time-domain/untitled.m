function [x,fval,exitflag,output] = untitled(x0)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimset;
%% Modify options setting
options = optimset(options,'Display', 'off');
[x,fval,exitflag,output] = ...
fminsearch(@f,x0,options);
