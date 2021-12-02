clear all
close all
clc
format compact
load reglog_data_2.mat

RegressionLogistique(X, C, 0.01, 500)
