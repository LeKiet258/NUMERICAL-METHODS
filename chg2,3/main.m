%MSSV: 19120554
%T�n: L� Kiet
clc
clear
close all
% format long;
format shortG;
% %%%%%%%%%%%%%%%%%
syms x;
f= x^2 - sin(x) - 50;
a=0; b=8; aEf=3*10^(-3);

pp_daycung(f,a,b,aEf);







