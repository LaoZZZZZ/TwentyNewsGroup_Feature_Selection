format long;
load('../features/bagofword_train');
percent = 0.25;
[m,n] = size(counts);
var_greedy = [];

% cut features whose document frequency < 1% of total number of doc
counts_cut = DF_cut(counts, floor(0.01 * m));

% Greedy & Mutual Information
greedy_max_num = floor(n * percent);
greedy_max_num = 2; % test

tic

feature_greedy = FS_Greedy_new(counts_cut,labels,greedy_max_num,var_greedy);

toc
