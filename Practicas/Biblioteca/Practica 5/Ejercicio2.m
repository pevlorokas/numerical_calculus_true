clear all
close all
clc


f=@(x) x.*cos(x.^2)
t=linspace(0,2*pi,3)
y_df= aproxDeriv3Vect(t,f(t))




