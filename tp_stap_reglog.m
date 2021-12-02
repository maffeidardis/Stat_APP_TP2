close all
clc
format compact
load reglog_data_1.mat

RegressionLogistique(X, C, 0.01, 500)
